# 숨은 정원 · Hidden Garden

사진 속에 숨겨진 작은 사물 5개를 찾는 한국어 웹 게임입니다. PC와 모바일에서 실행됩니다. HTML, CSS, JavaScript로 구성하여 설치 및 빌드 없이 배포할 수 있습니다.

## 규칙

- 총 5레벨, 레벨마다 10라운드(50개 사물 배치).
- 열쇠, 나비, 버섯, 달팽이, 깃털을 찾습니다. 찾으면 동그라미로 표시됩니다.
- 오답 3회 또는 시간 초과로 실패합니다. 같은 라운드 재도전이 가능합니다.
- 제한 시간은 `30 × 0.8^(레벨−1)`초: 30 / 24 / 19.2 / 15.36 / 12.288초입니다. 화면에서는 반올림해 표시합니다.
- 10라운드 성공 시 다음 레벨이 열립니다. 완료 기록은 브라우저의 localStorage에 저장됩니다.
- 일시정지 및 다른 탭으로 이동 시 시간이 멈춥니다.
- 방향키로 탐색점을 이동하고 Enter/Space로 선택합니다. Shift+방향키로 세밀하게 이동합니다.

## 로컬 실행

`index.html`을 브라우저로 열거나 Node.js 18 이상에서 아래 명령을 실행하세요. 외부 패키지 설치는 필요 없습니다.

```sh
node server.cjs
```

브라우저에서 http://localhost:3000 을 엽니다. npm이 있으면 `npm run dev`도 사용할 수 있습니다.

검증:

```sh
node --test tests/engine.test.cjs
```

## GitHub에 올리기

새 저장소를 만든 후 이 폴더의 모든 파일과 하위 폴더를 업로드하세요. `index.html`은 저장소 최상위에 두고 `css/`, `js/`, `assets/` 구조를 유지하세요. API 키와 환경 변수는 없습니다. `hidden-garden-backup.zip`은 복구용 파일이므로 업로드할 필요가 없습니다.

## Vercel 배포

Vercel에서 새 프로젝트를 만들고 GitHub 저장소를 가져옵니다. Framework Preset은 **Other**, Root Directory는 이 폴더의 파일이 있는 위치로 설정합니다. Build Command는 비워 두고 Output Directory는 **.** 으로 설정합니다. 설치할 의존성은 없습니다. Deploy를 누르면 게시됩니다.

`vercel.json`에도 정적 배포 설정이 포함되어 있습니다. 공식 안내: https://vercel.com/docs/builds/configure-a-build

GitHub Pages로 배포할 때도 루트의 정적 파일을 그대로 사용하면 됩니다.

## 사진과 파일 복구

사진 8장은 `assets/photos/`에 포함되어 런타임 사진 API가 필요 없습니다. 8개의 사진을 반복 사용하며 레벨과 라운드마다 서로 다른 사물 위치와 회전을 적용합니다. 레벨에 따라 사물도 조금씩 작아집니다. 상세 출처는 `PHOTO-CREDITS.md`에 있습니다. 사물 일러스트는 SVG로 작성했습니다. 글꼴은 Google Fonts에서 가져오며 연결이 없으면 시스템 글꼴을 사용합니다.

사진 파일만 사라졌다면 PowerShell에서 `./scripts/fetch-photos.ps1`을 실행하면 다시 다운로드합니다. 전체 복구는 `hidden-garden-backup.zip`을 원하는 폴더에 압축 해제하세요.

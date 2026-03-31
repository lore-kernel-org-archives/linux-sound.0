Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F77377EC6
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985938; cv=none; b=YNJ7/mLxgqeN95uH6Pg0ROwgcp6MNG+QCRIbqzaApv0QODGyp491iL6QqcvORrTJHfHygLqiQm8Q2PrF5qudCqytNgjC72nyDBNb3pBrpQKrmQefLM5sFkqd9CalXf6DHjiCLZ4Na14IGOvnxd3zyXi8Q7xk8ZAxUznrM5ukEgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985938; c=relaxed/simple;
	bh=Pxep8ShXgtazO+VGLSFz5P/8yM01PvWE/5lLNXhS+c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaBmqoYamYBSURHjjDifqI6eOC2EDdJLYEyVbhAn5EGRQ3I0lD92JUcP101Nf/44VKTOFmm8DjsnD1uDLvRNgATXGCyw3st0ZtSSmfLLiQRqYk7FO1KjJkbVa+4JDlhcOhsOj2Jkl56ngOQBCXjdjUSzrdzzqaxXcn6sk83T37E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rlq2GVUE; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rlq2GVUE"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89fc4147f2eso62077306d6.3
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985936; x=1775590736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgqMDBgsls8VrRcKBAMepiA5qSxovZCXP/eA9qZEiNI=;
        b=Rlq2GVUEmV6miBuIPgLBlOtNxzyA3XN9NyApdVbUBKhiuWZiaAih5HZ2TF2wxiCqwV
         YLfp34RPAcQnNwN0umdsX/0ZazW+TVRT8s86PbYogH86oGYZW5LDssllZxjpbjkzYu4k
         8OgD9QZd2B70jnz7sob+34bdAyhaP3L/0hyjJvvhasWjiuN4yNyPlOHReK7xX0Hifotw
         pWCDnvg/CHMLCWKTqmiX4aPp0YAdT8RYLpJjLtItT2g2hkai0hMgysquNjEiDM+kPNE9
         UpEL+ecrYSkgM2i2kJUsLSnRUjuuI2gy+Ag6izrjWED7ZPNLuK9B3opmSbdznMu4tmYu
         57GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985936; x=1775590736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgqMDBgsls8VrRcKBAMepiA5qSxovZCXP/eA9qZEiNI=;
        b=ZUQM7Zm9p13hJXqMly5BqnZ/OOtBG578SunXqnH038Fn0/OymTqca2aRCHxZI80dc5
         s2bUtfFrLxk4MD5QKWfCsWWl1li1olWbVAAeViDAwrixfJJNuTPUPHO+G83wr/fmvK3d
         hY/prHOTuXfEe2Su9FPPrFUkkqK8ayReO3rn+uSIsluRphffUq4CtO2Fr0JKvLQXVxZH
         ahWBR9hVU2Bgrlb+JximIuUXDqRVvdYJ3rq9N7ck42OfJjHUKJKmJEoMBMotqIlKo5ug
         3mEmNvHzzNunhqHTFr1FH962E6RgImTinz5y4063CSKMkFjoKgth9+nzdtuIkfHBqbxx
         7Byg==
X-Forwarded-Encrypted: i=1; AJvYcCUyU1bThscrIc87MLgMyZ5q8o57Vl2W81B9v8TatHVh4XibervvStlFs/TbvGWNCnUUQ43skPp28SWMLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytESalH3Tu+N9LPS+hY2jb/aXYioaM9OBq87r6uDZeA5+DCtDc
	HvQqZYUFSjxvItr3LgVxnUpRhfx1ai98KFzBn7HZsR55/tfVLO0Yscp3
X-Gm-Gg: ATEYQzzjKpx1ObcRl099ZGxExZKh1NmUwiTNNPVIN7UDPJfTApd0qAF/Xwb5+3VppeI
	KWyuTjgLgncXhwDhcfevE9WiJuXKUCHml/qXuaS0rSYsu+3je+Pe/kE1x41L6td9Wp32SiOy+OX
	LJdOk92Vo+Up8RardgRSqdlGC66vIThJquJebhGq8vUyMQpCnLC4ffX6tsDJQYeM0TUgFaM3irR
	rtPgy2ts4AuLyUogr2WuggPyhNL2EqAmRomzjoDX+OU0rJv2553B+yz7AD2s9Rud2Bs0q5Uelk7
	IycZivlZmH/1zZYjaEmjKn7PQv2Ye3XWWcUlxbG9M4pffikTnaPQ95ytnRddazxCt9WeP1ayTSw
	CWRV2Zn6S1LsftP4NHW23w9qTB5CiafsIDsRrGdgTbKJsgY5faLsh+xx+i3t/4FT+qifv8MBz9u
	tHOSkfEAh7rU7GgKfcdyvuj3Nj
X-Received: by 2002:a05:6214:4e16:b0:89e:a170:6b13 with SMTP id 6a1803df08f44-8a437b10430mr13147896d6.20.1774985935785;
        Tue, 31 Mar 2026 12:38:55 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf865ccesm95864616d6.39.2026.03.31.12.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:38:55 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 00/15] SDM660 sound card and internal MI2S support
Date: Tue, 31 Mar 2026 15:39:24 -0400
Message-ID: <20260331193939.40636-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the SDM660 (formerly "SDM660 internal") sound
card and support for WCD codecs over internal MI2S.

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

This series depends on "ASoC: qcom: q6dsp: few fixes and enhancements":
https://lore.kernel.org/r/20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com

Changes since v2:
- add missing sign-off (1/15)
- use definition of last dt-bindings dai cell for LPASS_MAX_PORT (6/15)
- move sdm660 support to existing sm8250 driver (11-12/15)
- import WCD codec patches for MSM8953 (3/15, 13-14/15)
	Changes from original (https://lore.kernel.org/r/20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com):
	- add back empty line in WCD dt-bindings patch (3/15)
	- add Dmitry's review tags (13-14/15)
	- rebase onto q6dsp fixes
- rebase onto q6dsp fixes

Changes since v1 (https://lore.kernel.org/r/20260211020302.2674-1-mailingradian@gmail.com):
- rename sound card to drop "internal" (1/11, 10/11)
- use common headphone jack code (9/11, 10/11)
- remove no-op code in sound card driver (10/11)
- remove inaccurate comment about clock consumer/producer (10/11)
- add review tags (3/11, 4/11)

Adam Skladowski (2):
  ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
  ASoC: msm8916-wcd-analog: add pm8950 codec

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Richard Acayan (11):
  ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add internal mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to internal
    mi2s
  ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
  ASoC: qcom: sm8250: add SDM660 compatible
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Vladimir Lypak (1):
  ASoC: msm8916-wcd-analog: add pm8953 codec

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |  11 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   4 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |  14 ++
 sound/soc/codecs/msm8916-wcd-analog.c         | 144 ++++++++++++-
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/common.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  46 ++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 200 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  78 ++++++-
 sound/soc/qcom/sm8250.c                       |  17 ++
 13 files changed, 570 insertions(+), 12 deletions(-)

-- 
2.53.0


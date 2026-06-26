Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6C3D1CBE
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454431; cv=none; b=rmU114Lvh7Eiby8U3vGYkbmDeCLF66SKWNg1/dmuchZZSOldkdmQKskWIhYOR1VM3HJeBx9lxeg5JjkSM1V+ZZVS3/e7tShfLT1dQT5nXf25PE9NRkH5aTIGJpu76aNjdFzKKRL1feXL/87YP0teubXVKq8LTxrjt6BLKWIuEPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454431; c=relaxed/simple;
	bh=R6SYI3hSlHmFpqmI6l4ZS+xTVB2si9oTQsINCx6aWdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYl/IeCbAkI393BMiFSfCtN2kB8I/LNKrm4i3IiEURjPqGDtaZXU7ydjawqKVN0aFCc0nnMggK7DW28XnHA4UG2MyeX8xVldt08NZJ6YkOWoZ1i01rfGL6DpCSAjLgAMWs8bB9WBmiPpeXln3THM/wn/kmAGpaETn3plPLdqV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSZtKjLa; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSZtKjLa"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so375395a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454428; x=1783059228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/0td7aWGEXYKguHC2/uXp2GMai6pr3CtkzjBaJbjro=;
        b=fSZtKjLaLR3Ro/lI2L7GMg72kfm+7mqkfl3RPZl9AJYpmSVKdV/vr53oTWlN9bCSpS
         AMDpG1vttQFUu+6AJLbs5n6fo8ljrL5Ia5Gy9N6OUQ8QAeGsYHXnoN8m5ZVAtlNlMte+
         TmVfxNHuP8NZrR3z4wYrxOHA2/ektT/L3RB4GL5/FfHt042iAlM0tUMlaATtg4QcPpBT
         mQDNN5HHm5yEH35Kq/6aZf8EP2gq5fSJsyIeBXOkaJTm1nP8pgoVsb0YsUs8Jt/s7Tfk
         gQlmM5ZtUM9cVPxn4CuAeWWW8U7nrndjVoHoqW5e3FGIuByLV17v/DiFy/blYMKAaToZ
         UmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454428; x=1783059228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/0td7aWGEXYKguHC2/uXp2GMai6pr3CtkzjBaJbjro=;
        b=nVId7sEIlQWqvrSuuOc2hyaUO1KUAQtXppyIdGqisHLZNfV+vbO6AC/GSkUG8fvBvN
         f7/m+9MA7Kl/OvK77UFAAUwPvlIbXrzYb8t9Qq2XEl++Vvop2Ki4m81emi8xR73x3MZD
         +vqPWeAlGeUuylVrQ6nNb1nDOt12c6ouVSJsci35TOnR/G13g5qB1h93aOTEO44LW4Ln
         m7kcQFnU4Pmq3MkF/feYzsqOvNDmiCR+sCUe9PsTlHJT2akbp3KbzkasgJxcT9Plq3GP
         dabaOtH8mOXyiUATx9x0rgeUwal2xWdHsld7JP6Edd/UosUtl30FO91n9n0AwXpw4gyy
         gqCA==
X-Forwarded-Encrypted: i=1; AHgh+Rpx8/l0caUvil9Am12hUydfMqe2WWRcTgyRChvDXAoEx5Gx8uqVxUIMTvplRaewLXemPA6pCryfw2CzMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySOzvAk/nKCmXJY9fMHo25vNPvAdHHkUX2bf7ENtzu8ueCcQcX
	GeqtzlnG43Ka5JOKdfWi2yDh9eKwa/54/128St0Q0OKVZdsXqBCRwDWO
X-Gm-Gg: AfdE7cn/X6iC6bOcr5NwwPlbONrvPst2iN5dfoqhyWTg3m6fl/gU1yKBHzO3v8Zo9wL
	QnNpqwM1sTUG+HdCnvCYU4bJqxal+p8ukSMVdKZlw6v5IkEo5WARcSVuJaC0+9riE2fuoq0YGaQ
	BmFFjEb+47LCKd6XzqViY3+vy1ic1L/fw2juKHBtOGoZHeiyUuFJwywOuysP8iMstDPI8d2G1AD
	Bl/K8Vrl2MXnuudH+9SosKBPK6BvMHpAJgRKV35GPZqr387YTv8EHxIRryelEq9ADRj1Ph9I2Cd
	5NIhOULkylxPpSU277ZZUOT59frfFVeEu3PM+eIRRtc180jlPU4tWeZFbJoimyrPZNQf5WjS9eZ
	gfe/8ie0V0aOYw+fdolcvwIdgqhlNiV3e3zwRbrz0R5dpYP5htn7hmbERXWcOmxthVOuHFFs20n
	+s7+16BiSTd8598QcM9FT5hbS3XLhWrpP7xoUft5gSQrEn3RQ=
X-Received: by 2002:a17:90b:5387:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-37df90a85cemr3835851a91.5.1782454428422;
        Thu, 25 Jun 2026 23:13:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:48 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/24] ASoC: codecs: Use guard() for mutex & spin locks
Date: Fri, 26 Jun 2026 13:13:05 +0700
Message-ID: <20260626061329.23264-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This series is split out from a larger 78-patch series to improve
reviewability and allow for incremental review:
https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (24):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() cleanup helpers
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l42: Use guard() cleanup helpers
  ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  12 ++-
 sound/soc/codecs/ak4613.c                 |  83 +++++++++--------
 sound/soc/codecs/arizona-jack.c           |  39 ++++----
 sound/soc/codecs/arizona.c                |  26 +++---
 sound/soc/codecs/aw87390.c                |  10 +--
 sound/soc/codecs/aw88081.c                |  18 ++--
 sound/soc/codecs/aw88166.c                |  24 +++--
 sound/soc/codecs/aw88261.c                |  21 ++---
 sound/soc/codecs/aw88395/aw88395.c        |  24 +++--
 sound/soc/codecs/aw88395/aw88395_device.c |  40 +++------
 sound/soc/codecs/aw88399.c                |  15 ++--
 sound/soc/codecs/cros_ec_codec.c          |  18 ++--
 sound/soc/codecs/cs-amp-lib.c             |  11 ++-
 sound/soc/codecs/cs35l56-shared.c         |  19 ++--
 sound/soc/codecs/cs42l42.c                |  54 +++++------
 sound/soc/codecs/cs42l43-jack.c           | 104 +++++++++-------------
 sound/soc/codecs/cs42l43.c                |  16 ++--
 sound/soc/codecs/cs42l84.c                |  10 +--
 sound/soc/codecs/cs43130.c                |  72 +++++++--------
 sound/soc/codecs/cs47l15.c                |  11 ++-
 sound/soc/codecs/cs47l35.c                |  11 ++-
 sound/soc/codecs/cs47l85.c                |  11 ++-
 sound/soc/codecs/cs47l90.c                |  11 ++-
 sound/soc/codecs/cs47l92.c                |  11 ++-
 sound/soc/codecs/cs48l32.c                |  29 +++---
 sound/soc/codecs/cx2072x.c                |   5 +-
 26 files changed, 305 insertions(+), 400 deletions(-)

-- 
2.43.0


Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BD12741B5
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852394; cv=none; b=t5k2EaW+wro78SUBRriJRr451W4DpnZcGnJ18f9nIaPIhgZO0cdrP46IM2TZkTSorkaGCmhqSzr/DQ66/vUn2IfxTqHsrh9VEklQLXgF39Ct9Yharm0rno5snrj8DzfigX9O98G8KfTxM744fjkQf+h3+wFcHGHHyAjmNiHAskY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852394; c=relaxed/simple;
	bh=cCOGMatOjCygJhaLm5dX8JbCRPMR6iiz7g0izRcmSi0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hqei3uwYP0vnqa0EkcFeffw63vuVLpTfxFD0ehBki0+AtAr0KvfEikxGMdqRXA0iOIrnjIRFkoOMykeaTXeVrjffQaRIzQ6O9LeXoWB5lR7BU26tLcetMMAam2qEQn5PJ9f6QfIU1ke5Vr67XuD+venY+3vhFR8hhIeissEKbEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=R1aTZ08R; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="R1aTZ08R"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8707005183so788888066b.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 11:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852390; x=1769457190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62M9fYxW6bxhQFoqWyOWxOUBKTY2WZNqWwY8w9HHiSM=;
        b=R1aTZ08RH6ZHNku6iw0E1BRVrnMJI0KDgf1o+dYgDGhb1W0yZcDd+CAt1IKExp/TTD
         lgD85kummfkh03GSsOORCmhRtRDq7FuFEFvCk3UrTIyl5y0G10BOzBpstK8V0cS6k5fV
         sxOjxBmAeMV6D4xmCMG2TBnw5T5cGxdJV8WklwStt1hezoXWA7Brq5oNuV2X6o8QcSiH
         bL0SRUmGWNxm3DtbCvFxbYEhR13mU7M8/Pv7Rr7AOAsLTDkaFsPRHL4UodP54JFvk9rG
         QzSwxE+rK+ewNoYLhjLqHrew5ppyyavq37+hDgOjFDEpr/XgV39/RYUhSp3o6Du1bLio
         hUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852390; x=1769457190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62M9fYxW6bxhQFoqWyOWxOUBKTY2WZNqWwY8w9HHiSM=;
        b=YJczaIXPh9u4mzHDLqbNskF34P25Dtd011lanI6PA56bp+K2A1kA6JVvqsKGoEltrj
         xw8lb/zxw+mouB+y8iMwZ76zyonL22cSeJctARVdVHLa+kE9011Ok4IqPTbWzqX9ANAt
         ZQWi4pDAuWcE2uUl9adVEF4c4zaQJwkfcaECBEixoCzutrvkyHKvMsp1oM6VvA75KoB3
         cL+QFP0oj+r9soiY4GiKtedfXofrWKYHbSoJZJcaSYe27dhqwuwqJ9hVmWym4abRIIdP
         DsAYbQlc+zVZtq62fx/+ZxXSMA3/RXiU/iuMTQtmoa7gJPzL7iQKtdANX02XiOJGhl/R
         zJng==
X-Forwarded-Encrypted: i=1; AJvYcCWNhKGKSu/G92eybcOS12KzO9DetIeSIVW1FF/DAstBsyFICPRdqMYNqPpv5I1OPGyJxJlvryyV59nOJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlkkET3XgQ0bdBWHF0Yq27Zxo7cPkiPKcIncqbeEHkaDiGfAX
	1zcbsy4V/tpKnJtiuBgr4XiXFYfO9pQJ9/tRYI6ps3kh72NK8N8Ob+Lkv8e++d6apXs=
X-Gm-Gg: AY/fxX6uIwR3wSUPcGZjdLS1FCBaEsgODtM6TJL8W14Y7ijkkTDvtOqZwj/suBm/DC6
	lp9NQ08hYIQmPx5mCuw8Ll6WHzU2KNS3RKjaIvDxy2xhFri3kq60JF7+rMpLWM5zLj6J1DUFbO2
	Rgr/6qbo0sR/bQqLdNWJyXd4pWu/0yZpOjKWmaxX+nMq0ijFansVFqKDUbh07etO8D0fh0FdLRg
	RllJz7DQJAuu0RvRfUrjWIQ4b+nIw1vDuQW5No75ngzQQNRxjvZE/5qs6Sxd76AiwSWivDjzqJ1
	S++WSj5udbSCm0zsvWdWY0nmVTmktASU4aSu20wUlt5WEANxGeFosHTOWFRCGcvh5/iKh6d94Ha
	j+aHkhFS+nwsQUSA/MGAXuRq5J8weH7ZnMkA8kHJ8F4/ATMWIIOQzt5Cba3cZis8xAWORovDUSJ
	xkq/J3P8ZXZ3I4eczrp8FnvY4ySXVj2TMQoU4O7W8=
X-Received: by 2002:a17:907:2d09:b0:b86:e938:1b3a with SMTP id a640c23a62f3a-b8792e37fc8mr1025443766b.17.1768852389914;
        Mon, 19 Jan 2026 11:53:09 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:09 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/4] ASoC: renesas: rz-ssi: Cleanups
Date: Mon, 19 Jan 2026 21:52:48 +0200
Message-ID: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds cleanups for the Renesas RZ SSI driver.

Thank you,
Claudiu

Claudiu Beznea (4):
  ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
  ASoC: renesas: rz-ssi: Drop unnecessary if condition
  ASoC: renesas: rz-ssi: Drop the & operator in front of function name
  ASoC: renesas: rz-ssi: Drop goto label

 sound/soc/renesas/rz-ssi.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

-- 
2.43.0


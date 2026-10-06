Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE13B6C00
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281786; cv=none; b=Z9UQEiX+5ZBFL8eq6W6o8R9wkzc88YpngJlN77eN/G3+CttGDQ4x0CbjN6pWblzM5XpvbYjQ+ulJn4P+ZECVifY6nrxOhG1wplqDB5eijMKzFAYqGD9pYQ9FqPtSLwXNieccT4kJI81oBYuswXNHiCbDPlPra2uus9RfNzrMHoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281786; c=relaxed/simple;
	bh=zMu7p4w1FFyQwFOl6coYwO47IzKVkZ6aTy9C/T+sik4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QrpjMZXIsDOOeJWYY1wX3GwoUllOZIuMp484iLfIXgPxjA86JiP3t/WfZY9dksL/m4tY1XRvd3/ag6xoKKvvMGP/BHwq9ydo2C4ANzjo29cODzExRGmnd1cB4mWaCIesJVnUeFH45m9cbfZHwdzNG4bRTA/enkj5n6FAzHMZN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p7EYZqOa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7EYZqOa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-86b41d77a05so282997b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281784; x=1791886584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=p7EYZqOapn5+Oofy87z0phMPAtxOLSGK7YNzVgEDkbTkKpxcODNDYK6n/etNRhY80B
         oNLPlnvesA/YiyAbkpvs8duz2Doi/5rp2OeQ4KBKXfHKKY3T9sRNT8+V4MuJHdHknvdh
         IvePyDZgGm+IKyvn3kq9I6wCDEbrbOtbDAQZpkAvhJncfxXQlhsyjyI6EdmukYEBRUkU
         tc/NATdtvmh2tdHX8vA/zbGW8XTQ8rhg/CBzsdywGLo4/1e9fGOSj+blKN+1Jwi61dv/
         DwYx2pXlf2OoxTuVBK5EX6fivrzJFEtjFlzqMa4lUmR3ppth3Vi1JsO7082gCi284mXY
         capQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281784; x=1791886584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=dWiI77mVYqofDmEmuv20OvZYrryksi3O9GrIEQQ14mvVK48lFpSyKR8SshRbeybjP+
         huje8x4u3vewPulQbjnE42YG5qVMni09tg2zHN+VCxXmUcGCxWuYrK/YjvvMweuCykK4
         uNQnpcfbyZafkzpVdFnevu3Kh+PL5DjYl8iSt5RGjiXWo6CfOlcmv2FXspjPdgFFsiYw
         tsvJX0g4+DaevAMZ6InVNXbGv2jZAIgJjsnD25YEaONdLFTVvVrArylhGGbX8gdPUSWe
         q9cPr33QG9kPnl7IrZRVLumn+SOHq8GZ9LvXOF26WjZGoItkO3ESgG9qwINJZDsb1MuX
         yjLg==
X-Forwarded-Encrypted: i=1; AKwUvBzrY7Pqlobl5KJeTkq4wBhjHtWyFTUEYyu1zeTS6wLY2YxPvia0+iK/tsXfboV265tHrSkW+Ea4/xC32Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nK0O2x4ktQW4k970+q1ldo3O/QTMpXP1MjcO41BTReeIStcsNn
	4J1UKf94D3KrwMxxc55DEODASUOdPwlkaJtCvCA1O8NhajdMEGwU514xGBgeng==
X-Gm-Gg: AYBFou2wZI3tt6YnYI20w6qODzZXE80g0wcAGThhU3swyP9iWejTUMdA22SypeDsOc7
	o1+2ytxu9h9RJcoRDdO92/V4aOnXeHPMcEyIReXf9BvREpsg32cIODEvQGTjIyoxoEPQO6znwAi
	ZkIH7B38brwXzb3jvFDm+CZf9TKHy3wzD4vchkMp5dTrxEexqrPJoYHPuTDDIRadwmr5a4l9ugb
	AdC7x519BkgoYTdQJHTizZFG0IXXqPZiyHL51lF176wyKKqqHMqMHeKalN4jedGoC5xUwIJ+a4H
	0K2V3LLTCusukUdRpVPg08McH0NVEoWHRWDsMyAeYxH9q0H58u6X7V78XKGVoQhXU/Y31owSf5w
	Vmuxz5acGrh/srsHpLBFdbsU0q3a8i/MGlIK8EJCI30A+ItVfezaLwQOe1K8L3r4Euxq2icRGc+
	AZfwcAPqD+z7kN5ycPR4d6j0ucp6hNOElvjHBB4F29tn+5nevE87n7ZtGC1mQqoGmQukViE2Ahs
	iDouanpTNfMJKu1z1TcExTR7HmM3i8Fc8BPTop2oELygcLIIVNJo8W3eLHUDGGX2lwLJ7Muq0Zu
	pE6zxptCdG8SJNKEInP5kaNC
X-Received: by 2002:a05:6a21:511:b0:3e0:da23:874a with SMTP id adf61e73a8af0-3e1246e1ec9mr796494637.18.1791281784146;
        Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
Date: Tue,  6 Oct 2026 17:16:02 +0700
Message-ID: <20261006101606.54079-1-phucduc.bui@gmail.com>
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

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
  ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on
    success
  ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
  ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on
    success

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 5 ++++-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.43.0


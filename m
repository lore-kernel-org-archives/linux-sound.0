Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382993AEF4C
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 06:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784528663; cv=none; b=ECcwrIaST0C1bLqrxbBOOSpzA3ysSF9j9q8gUggIWXmDBzyQzaNjvqUo1mIgtU9mzdS1PMUa/7va8NAr74dXouWaH60rNMnn1+bvjKqkIa88Za9UYL2hPDHJAhxSfhYfo6A9E1qQ4iwsUHlg5S5NJPviWCXuPJsztury4JfxQYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784528663; c=relaxed/simple;
	bh=IEyrBGamOBS7GfuiTxUUXKGxhoBnR27PUwSvcNTgK1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VN4MdtttPzgUySjw9NFGMEDXJI/BBifa0FSfCe/gXKKrmF0+mlvPjKttDaN0txBKseRLdmbBL68zYF0I92l0CmxX9VLQBsU9Ep9B0nezGLNxzg2s6rMdI7yiLumxZ7NV4mnuDb3U/HTK9+D/+c2IRPvTfuzFxnoxMuzeT5xBY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HmaK5PCE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HmaK5PCE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b966dd74so40208205e9.3
        for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 23:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784528655; x=1785133455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwWjJ2ZQ4Dn/YuAemilqSWMfsoRjNjVa8hSlo5maMlY=;
        b=HmaK5PCEfb3MWyuFjvdTCm8mWmA60LMXFwLtdX+/K6hoAfIYF11tr3uexr5zeaI9Xz
         Uv2av1JFcNN5Opv+1zxV0whvqP6kMh7Tt6nOjF/B4BhCTpApgTj2hZOYeBKYt9WrYS3F
         WJ1Q4jidd1IY94YUHzx1CAAodQrcbsiw9eSP9gHhLaBn9jcp55rBOG7VHyqFwB2rXAjm
         wFttOYWNEky6tABJM0aB4n88XWGQCUi8rQ3KIywMbWOKiuTZ3H4hjlE4Z3563vvEaW2F
         goIlkeLRyj52nkn9olTOhx9xlK99tTCJkLy6+5ixWuYLd3XHrTizuvnRU2WgqNseu7n7
         SICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784528655; x=1785133455;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwWjJ2ZQ4Dn/YuAemilqSWMfsoRjNjVa8hSlo5maMlY=;
        b=SnU0KBCa2jt45W3TZu2Sfxnt1eRLbnvJZv1DsBu6rmYVQFMuAYtCgzQoLNUZQLad4c
         GAA4KQXQMBixCCppCm6PCFF3La7yAcL8hgnBDgWH6QSZ3jKkEhGk1qP5IBcOpl+C+rAw
         wFmWk2s8hSmyP0L18CduU5VqpGrGAsF+AOj7owuiNWx5JpVkDLRwiaq6nZPHuhryMZCg
         3vjJKlUpK99ASjlPtRpxLhnff8QgHQsMGiHy7qZgRtlL8kw4pQb70PWtQw/RFVqdkq5M
         DCZOJmjBhc3Qz/tLcVot3/PeV8e8LQKOAcsuelZABRBFVXRk4mXDUxl2sUB3d8ZeGBq5
         ZlNg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4gTwiGfEWdtGL/vkwHWb5IvV8v2uPqusasHLUuQfsY+gfms+PSCyBBMy76BWq3DuZVnIPcU6TE4uKfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeb6MQQiiFhzyHAZ3U1nJzPmx50W8HIA74c7VpIx7ft/cEMp4B
	p9iT4WrBONY/NyVQvWGLbZjELR8PO+bdqobra/MgAqCyxQOJpqY7KmfOtk2uNQkDO7U=
X-Gm-Gg: AfdE7cmZgKNnOp+6zBWUtT2sRFqKYtkEW6wUz7wOpQ/FeGEzxUkDdirhVLgVtqogawh
	ZJWks/l+eo5IKfp2pIEuEh6WABtSZL/ZYgMPf9qRejpXsZSNl/DmytpBqfKGJUa2fzGeOAGeNlQ
	mdI/FENuuWs04jw/SNF8gEaa56G5dXAqk8jD3bAN+lDjQCOp/SyStlnL3aAZescYtcfAX2Ml2DH
	gyMlAyatC4mRndfOBcdAKMeQYA83lkXz4OOrjNzhxFoN/daDg0y6a31a8tyQJuCBF0tLqV6/hBT
	Wv6HDIGosuhHuZpCIUvztiUtGiMUXZZIJEZjTICRZErxu+llIIPRITxtCP2mwY84vSvB+MrAva+
	pXHTFq5nrAtli3sjLymBY6FXq3UJXuimeKFarO5Tgw9VS8AUwswZqz1B27fXLR1n2Un75iC0are
	AJUx82aH0=
X-Received: by 2002:a05:600c:3586:b0:495:3f68:699b with SMTP id 5b1f17b1804b1-4954a3f3173mr133709685e9.9.1784528654948;
        Sun, 19 Jul 2026 23:24:14 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-495499a5847sm185174785e9.2.2026.07.19.23.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:24:14 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] ASoC: amd: acp: Unify code style for platform_device_id array
Date: Mon, 20 Jul 2026 08:23:48 +0200
Message-ID:  <08137cf5b3cdd0cc2e00da32256664f3cb9b1e4e.1784528081.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
References: <cover.1784528081.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=IEyrBGamOBS7GfuiTxUUXKGxhoBnR27PUwSvcNTgK1s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqXb77fpCwiUmUojHzPSYC2J03D8fA1q0QKo/SU HWYUlW7i3+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCal2++wAKCRCPgPtYfRL+ ToLbCACb7ylvwE+PbS1ljscYDrjo3gZmaILfrxzzn7RiA657SZKqGCTIx4C4xGDIEkrx+yeZfjs G5OSgcenjLLxDurdThVcuQvJ9pajFx7wH5U7NaKCyu3GEHqwtyDEKzsApJmTLfTQ/F9a3PTPbFm xuOAAuZn1Wxe0h1JqafavYIMPcUgpy1XtXOZa4kHXNuoL0kNgqrfMwrAnFYTZoCTE5nn74YuDJ4 Outa1N0EMIHd6vXvoow3baPa1gMx5NnBIY2qPd4gUzPrWWL1keskfxTKonngqAM9JQAxSSax1f/ /8K8lJCm8Iti/rLXr6ia45kSdjcIZW8gEUrpNLt79LvCYWN4
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

 - Add a trailing comma for initializers unless the closing brace is on
   the same line and for the list terminator;
 - Use a single space in the list terminator;

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 sound/soc/amd/acp/acp-sof-mach.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index 36ecef7013b9..8874151e159a 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -128,31 +128,31 @@ static int acp_sof_probe(struct platform_device *pdev)
 static const struct platform_device_id board_ids[] = {
 	{
 		.name = "rt5682-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682_rt1019_data,
 	},
 	{
 		.name = "rt5682-max",
-		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682_max_data,
 	},
 	{
 		.name = "rt5682s-max",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_max_data,
 	},
 	{
 		.name = "rt5682s-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data,
 	},
 	{
 		.name = "nau8825-max",
-		.driver_data = (kernel_ulong_t)&sof_nau8825_data
+		.driver_data = (kernel_ulong_t)&sof_nau8825_data,
 	},
 	{
 		.name = "rt5682s-hs-rt1019",
-		.driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data
+		.driver_data = (kernel_ulong_t)&sof_rt5682s_hs_rt1019_data,
 	},
 	{
 		.name = "nau8821-max",
-		.driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data
+		.driver_data = (kernel_ulong_t)&sof_nau8821_max98388_data,
 	},
 	{ }
 };
-- 
2.55.0.11.g153666a7d9bb


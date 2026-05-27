Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171230C171
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890297; cv=none; b=OdZhV7bG0X5px/CCBNpOQV3rX+Gpj0fX9P6KXIE3GoOjrCNPYbXw+3VUbCFJTBXCweYw+CZ6mZedftXK1e2ilBEnaKym66xTZJ7RoGTrOUfaL8c8EZJ9SBlCjQMfupbf8WSBvAhVBSL1QGT6vSAwc6M7YfRZwWfzgzlHWd3Ry1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890297; c=relaxed/simple;
	bh=6N+ANPMgefHybKMAFexpaMVcK8mi6ROi1nROc0wifqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tox1iZrsoKwZCiO4V9mFyfcySlCqwb3GNct9WAB6Lr62ZwejCj5Z73/cetk9NjPoek+WBWLXTQKj1T5Q6I3zMf/n9z/qv/p5aEzoiGrcMdpy2rhe759McjJxmccBTOdm3f27thsDw4VhxWDt+LEuS+ZOgeghrq3fz7n10IufM7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I03T5x/q; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I03T5x/q"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-134fe980658so13406778c88.1
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779890295; x=1780495095; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=;
        b=I03T5x/qHdT06VxucSMBG5C1l2OImKeo32HsXz5RghuOLoK8jspR8NGvXylqfgGklB
         JgZIKzpz3+hdsNug+aSWCzNozlhPflgFkIT3+GWkx+Mfly8OOKiy/ZaWa4/FfNb7Vqsy
         B+HWPBABiIFGVo79wVw/dVOQiXCZZlu+uyj6yRJgjLgDF5u2/WkdY1ZLqyEACm78aW1U
         oa+nLXLyfwRWn8GgNzYziqRnBKHuxNgYCz9hWmz2xQz+15iASKhs9QZvCJ14vJE2WXSN
         fCyKEDgq2hhulNZxXrXFQm2JbBbYRfUPHu+3iSH7/5yaBeCm/xKQxb+qXGfhsibghdcj
         RXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779890295; x=1780495095;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE1uFjLQahicP6Pul0+3gr6Dj3sANOaIDcF9iPOsssE=;
        b=lHNiutAFDB3v4dIQTypwoBjRFeadO/K18Et6RaeVj7MTgxeJtYa0VwPDMH99gt9E0k
         dnDvLGOrjF8iK3BUREjstiG+s4+qfTklJRcbhby65ScTpqalCNTA+XFZZf6uri1f457s
         jjuuyY4+kUkT/Le0fTC689cUnpRrioU8lOCJr0EMS/mg50nqVUoBmt/f6jHUx1+T0A3N
         LWZxMRcKjVJLHl6iXtZrRp/WC5LTJMIPXeAlsIAs2sLDtX4xaPmVhFItHCPcHk8VDg5u
         XQUuP/x6+hRVW+lywYwAkGXynWwiD/LRhC+OO5VGRh5cxvkpkrKefUpiKZpQvAhZcIi7
         RzJA==
X-Gm-Message-State: AOJu0YzLs/M18epAETqS2cEXthx/Xyj4WT35V7KpFb7UoLdAO5HVTz2E
	JIvuv/daWTt4lokYXNwo+2Sfp/eC2g1bPvv/NzqSVp3Jxx7ZhfphKteF
X-Gm-Gg: Acq92OHXTsPCSJO+ISSDfZhxfq6qrdmJKK6UVwIf8rW2Jxd49oKGmC29HAdIgTY5u0j
	4LcR3XjZh41abgVyu+wHWgCVUn67KooW8jQy3FMo1vSyA+7iYchhRh6lhAWJ9EohbleA+WL8gUH
	XzSdHmF4AIhob1R6cTVbRlyvUjm66KcgflrY2mcA2S9z+79n6TAiGAlQosvHyORupokvZlgYlMJ
	Mos2qnopp3Nz9nHFtlPKNihyorDZ40fYPnA9uP1/DebByapwdo5NIVNbupSA77U04yeMj9G4OvL
	+kAa1UhpAji7/PSB6HpX1frDx0ByNFI96tn1xkuSMYaekQVIFpaYnXUI2K6U8k8tladbUO8/CXi
	Ygduxj2/VsnM3/RxmjkwwjYscYqDDM3MfnKhUOle6QwsEM5/gwFiVrPYyHZN/mBPbqZ2S+f+Y8D
	wDIjOm+xfUkGmljCEgMgwip/jRw9PvykSGobC9ge+e7YPbemlKB48KPblrt99mP6fYI9zCg71Xx
	LseoR9kfcTU
X-Received: by 2002:a05:7022:20f:b0:137:546:9e9d with SMTP id a92af1059eb24-1370546a30dmr3647362c88.23.1779890295149;
        Wed, 27 May 2026 06:58:15 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1366aba2b9asm13013788c88.15.2026.05.27.06.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 06:58:14 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH 0/2] ASoC: mediatek: mt8192 probe cleanup
Date: Wed, 27 May 2026 10:55:45 -0300
Message-Id: <20260527-asoc-mt8192-probe-cleanup-v1-0-1bb834d05b72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CMBBA4auQWTsJTMOPXsWwKGWKY7RtOmBMC
 He36vJbvLeDchZWuFQ7ZH6JSgwFzakCd7NhYZS5GKimrm6pQ6vR4XMdmjNhynFidA+2YUto2Pf
 kzcBmbqH0KbOX9+99Hf/WbbqzW79DOI4Pzadfxn0AAAA=
X-Change-ID: 20260526-asoc-mt8192-probe-cleanup-3ef72f38e3d5
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=6N+ANPMgefHybKMAFexpaMVcK8mi6ROi1nROc0wifqk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFliP4q4WNfnRvVybPEVCw8X7y6/cUaq+uTreaterYh6p
 6a/5mhJRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzk7WaG/ykizCedV/beSnb3
 Pr8iTL/pXimr0hT9p+eyjzK2chScPsDIcDEr+pIXS5BX9/a5PybZy4tPNFgQbPfKsvfgxMYa9WQ
 LVgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

Fix two MT8192 AFE probe cleanup issues that mirror the recently fixed
MT8189 and MT8196 paths.

The first patch registers a devm cleanup action for a successful
reserved-memory assignment so later probe failures and driver unbind
release it.

The second patch checks the temporary runtime resume used while
reinitializing the regmap cache and makes the regcache failure path drop
the PM reference and clear pm_runtime_bypass_reg_ctl.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Cássio Gabriel (2):
      ASoC: mediatek: mt8192: Release reserved memory on cleanup
      ASoC: mediatek: mt8192: Check runtime resume during probe

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)
---
base-commit: 93f1bbc69dbcbb29544769c4d6f3456749ad9013
change-id: 20260526-asoc-mt8192-probe-cleanup-3ef72f38e3d5

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>


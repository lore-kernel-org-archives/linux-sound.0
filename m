Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FA3CA4AF
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311865; cv=none; b=d1N/T5F6JZdiFqqi+K0vxZdjgmVePXIUC37OD1TJgsfdWpt//p9TEhXzqdZBWIQbpyRH/z8N57ycBzkHGMb9bOfe2VqunbAWZ3sdLeDw5oyGYrsBqq0zrEWFHvtDANJfP9kagwJUxvyvbaYZgAOeRBPG7d9h6b8jPXdnH5mCAV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311865; c=relaxed/simple;
	bh=R4W/s5gJc4IPH9tGG0NMkgYOTqk1l/A5nm8KgAntf7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m0JggeP2ClJoPucR0ARCZq26Sbh0t+b6mOIvSjDZ09QmEVbHaUFOPv9eU8W0022bHAi49e77LruEfKt+WPzNP5YaI13DJCatKpq3TEyRSSSlsAck19Pemuf/5VnwfMzOrX99vkkzRuyWyzOyhwXJ+qcv9W6rAw3Ha6Zp2WRTjzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFEq0Hvw; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFEq0Hvw"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea4ae2dso162909a12.3
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311858; x=1790916658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=eFEq0HvwsorQ5Vu5uDcdHzrpdE73JhTAP1QTgTTy543bWw/Mwbds4K56giRGVEH5h0
         KhvNpUvHhhpjrfp6xUdUGYjjDis0C0DzOqJd10DuLXbiYlyHihITS0k2JrJluS3KD5fu
         nVvjTkaRADu56Yy2RFAyPPZ5S+2S9qMiscrWyzrYKBpHFTUEgId8U7arNIep+lBCHpVW
         6q5mD9YraLhm6ubFPYzNutRBjGKmFQMpY7ij8LUVULLfjjn8vS2pHEDCd8KSvYZH49h0
         rmw8Kp83iaHGMA3McSTLehmAlZwiy+RpvWf5/zzj+sUxX5GjU0oblA8SDp5LZFy0Jm9X
         SdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311858; x=1790916658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=YxePogZbJfA2Z6UEt8w35dHt4i/herJO1lJqIaOO5MDbxh4AME6hE90XP+TfaxTiGl
         Usow6J3Ak/FC8GmVTf5b+czQAG9EjMRY4OGKrwU7243ZmthoZyZTF1K2Zge93OJGdMJR
         yL/bzqA72YpIgZFE+uKb2rdDl3+BzvwepNN9TPPilIcrPeOJWPp3HogWB/QcKXEomN+q
         ERkSRFohi9Uaz0U4/9h06XLiAgr5ZoepPJxv6ZugWBy60U+tA8GqjHfTIboWoXt6+Y/Y
         uIxft7V9oleOLN+Z1BDceAw1RUeyXsjb3H1FdAFruxWy6KHmuIE5ULArLKpWdOMzRm0t
         p0Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxx4/nskndN11bEqmax+U/gBUCJo727cLSeCvUFSL04F4I2D3HZ98wqHsg5a9komfHGB3n+ixORyLYp6A==@vger.kernel.org
X-Gm-Message-State: AFuF++mdnGsV9IV5cdDlFpREFSZuWa504DQWs3p5hrE/TxMhVagPD/5t
	PJwXsGiwUig2zLI3PqImIy+Qkuyc+Pw9GUj3HKJFhtYCDdUEZgGJr9qB
X-Gm-Gg: AYBFou3ehGAXx3Fyqu3aN1nThSTgsBlGQjViZ6DjOJGaK4hAJP5swwm442aSfP7CWCE
	oizPUWtBRGAJbC7HtemtuWXfktuwvI6H7KDYuN6Jxv0CbuI41ff07GonirCc6D1hrOMT9E9pl20
	ZAs5wTPvru0GRZVpoPlTfRvttdm1OwRFi+MN/L21RYWG/i8tyef2sqtxK3rphJUF8waOGdjtK3S
	gnFBHRbX+c+JylhYRVMFTGkVPB7FvlFcpqWAPccXSvQoBThy9Fz9iqIkVaxRDw+WPBdn+Ucdqrp
	xVmOVU580vdgKMObl9BK4MQmu9Hf9yBuQJsWcvVa+UMgxDnRi4Jv7E8bfFeFlZC0Az9jarC3+pi
	vWIW3GPT5qcdq52jMbWUwbW08GCTNpu5oPCmpYnTpZdmHJxCCcnUbCGJ0Fu859ZZqafs8ef+TZ9
	oNQJXvphq+OQqAfEdOuvFufUMYbnoArMcrFYQp2V64o2H7wBCiyTwiwz6EH+RyALq8Nb4Yy59tr
	k7MvPDuD+nr8xFv44N0099+VLK75wLYZ8HQoij+gjSPLJ7X1sHwwOnGNewOgrWSiFmGjluWfGSW
	tEG0ygmgwZjDcA==
X-Received: by 2002:a17:90a:d643:b0:39e:6a7f:1dc7 with SMTP id 98e67ed59e1d1-3a098db98a7mr4301609a91.35.1790311856643;
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:56 -0700 (PDT)
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
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Fri, 25 Sep 2026 11:49:08 +0700
Message-ID: <20260925044908.450775-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0


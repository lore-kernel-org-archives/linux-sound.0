Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7203249364C
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456038; cv=none; b=bpcd/lmPfXCZadn4Fc60wnNxR7TRHET8rQcXzYBv64YN89Ivv6kpyD1FEP/DnvVDmeTzmNgGk4Zc8zxYIH5QjT/ZMBgTXI/fm5PzcXHkIm4E/v/toQhPvGK6gGxOiSgo37v9RZEH7bmN8utSZE1FPNzZo+2tnxLsT6Vfwo9ejjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456038; c=relaxed/simple;
	bh=nJhvrGr3lgVZ8FMtw/5ZoBJyNuHoH9T5gKcidfHw3xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhwFzGTXssI/k5+8ffU0TbuSugBXSLYCnzh0XSqjJQgibmlbOl7yjDZXVQfejSlid9n62UoNVq7BjI/mGH+CwVMcALY20fm1+rKpifggq9VoRQlo9oi+MVv6eKRU0RaIYqWauLY89p2bfltJhwUyFkdqLJ4KMIW9ICcjGOoS1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ+yFa9q; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ+yFa9q"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35120d43ecaso7719911eec.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456036; x=1792060836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCoq+QQx3kZdKIK7QgXRpmYJ03Qsfh2Iq2ERtZh+EYs=;
        b=dQ+yFa9qP9fusDVYGXiBSV8aiH3dg2a/H6kRFXfSdod9dxSUYanLrGwSL5H9cZHEQ6
         vXkF1a8yfb6EjXlRXLQkwOcq1OOPmvmcwkOy5+3VyYnI5OGhTmbircUrgxtCi5iwxJMf
         /HADZQjoLL2fLq6QVlbiGLT+MIxg7BlEbpwNZZ6FvKlNJmIhTUG5zdC0LoFYnxHSXsBB
         vjgw+0th4yZUYL6lPb+gQcvGuLMoDojvDoaI1KxR3YOoFSSIEv6mAFDdZYyB9aI5nr1M
         jbINA73VhAkbN0DM7SF1I6zdmZSwNWA8MCrw/b5SYnzZQ0slfpOBRrXxVE/tLTXeg5y3
         xatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456036; x=1792060836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCoq+QQx3kZdKIK7QgXRpmYJ03Qsfh2Iq2ERtZh+EYs=;
        b=S/ayvZ7bJvoaU6AWZYfz5XHqeJw2sH94VYXx6scRzq/ARjV/uobY3OIDawU1W7/trJ
         TVRp+3gUteAZ9T8Dk81r8yrIUjtb0JrFs8JuIhmVugjt12FoCJa1/muoz271mQKBvncb
         ErP7SRlAKCe1AUIjQlArZBuUpwx/YVT1rtcErQcX+mg5+AxTQzpfLmx+F+qZn87d625A
         cT2uN4r92QUes4GP6ZvZF7e+9ancLjrtWXbakCxlxCJUx9SVgM6vNe+CVQDMii7qxaRC
         AjWORiA9r3vuxwIXqvkL0ipWrTBhD/J1OQWiPBvLkMYdhJQu1OGSy+adRSKs+9VMduEn
         VX5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy71QL+oz7zcr0rzpCxpGCyI9dfzPuOuzTwHjMMxwEfJQmZK2TUm4jxL3R9VJpvG9ihRVNni4SrDvKg3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1Wvz+bN8mu4dmD3WsFqs7uPgr8mSTdE6OG3K45H66w107/8AV
	ZEELyVTqjzvjZUq0blx+0gnfGx0fwe44YhPWu+a12D5BZ36yBO8Y17yz
X-Gm-Gg: AYBFou0roxGOr5epPoUpFFmyCerQvvbDo3Y29y1Tk6erCy50MUwVl4pheHUK7kVtOOa
	EB+J3tl21R/fUWL/LPz55o490HoX9CDo+Ga4sPoxvAU4mr0/5rsakngnzmJc5DG9oMjyTk0PgFn
	1kaC6saDVEspltrEwrs8Zg1fdQBbHuiSJXUcnyGWcTSjgizVC5LP0t/DDyUKfqvaA++pJXIGCM3
	k4sKNhISNyDzcOjQWPdoqo0Emilv6SNLwCAppKBWj61RExmY1oHwYoQAzrABknmjrI4FSf1Mvb9
	krtXCbFS99/vKJQHbtYa1k5TqCJrKFOol4d/qwN0KvvSkVNQ5h4UCzeBp/sxUK/PG6HL2RTDpy4
	XtEo1R5qFetjM3f/HCpfir0/r/URteMkintdRIU3zQBPWT3P9rGKwOgaQdX0ap92EvZNknRRRzg
	RdA55kpsE9rVu2EEthW2R9tG7iHUo5gy5aW89fw9K8QB6MHO2sIRAiBTFDK7H4RCabqHRUploIK
	naloYKvlHa5wtmFJY+e3r+KFz+iJ33SR53YG9STUs9s3usMxmGdUD+N2m4kFsd4jFsYRRVSCjkq
	By7uZxAZmvxTcb8ijVJxFYL/
X-Received: by 2002:a05:7300:b088:b0:34c:b75a:ac1e with SMTP id 5a478bee46e88-3515df70a46mr6358739eec.33.1791456036268;
        Thu, 08 Oct 2026 03:40:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3517810b895sm7496369eec.17.2026.10.08.03.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:40:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/24] ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
Date: Thu,  8 Oct 2026 17:38:13 +0700
Message-ID: <20261008103831.542533-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008103831.542533-1-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

snd_pcm_hw_constraint_integer() may return 1, which is then returned
from acp5x_dma_open(). ASoC only marks the component as opened
when .open() returns 0, so .close() can be skipped on rollback.

Return 0 explicitly on success.

Fixes: cab396d8b22c ("ASoC: amd: add ACP5x pcm dma driver ops")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 831e30e9b042..33d59d992ee0 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -231,7 +231,7 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	}
 	i2s_data->acp5x_base = adata->acp5x_base;
 	runtime->private_data = i2s_data;
-	return ret;
+	return 0;
 }
 
 static int acp5x_dma_hw_params(struct snd_soc_component *component,
-- 
2.43.0


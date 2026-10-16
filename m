Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A0537F732
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 04:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792123875; cv=none; b=FPbVaBW9gzRFsRXQvJvFdrfehtQYnBwY5O76OUKXaRLW4tVK5J1MjfuTPzsC4ls1FurInYVWmbeAbVp+KAJBh5EAjR+s1IHAhkPTjxvLXmNlVMcFGOJ1Do/5ZW8PhDE55Xu26iIdu4oyWdvXGj4Lpli79SDlHqbt7t0YiM75clE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792123875; c=relaxed/simple;
	bh=fvLkZCJ3WJpgMh2sp/BTiEgwAehjZvHvIEf8HbSdvgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpDxXIc9hP5ijngmghgePtUd1EGsOaEGcrxsQA2Kg7PFLGXMfjyRlPKhQ6ji3p0ZQIq/SUf6HyCP2aMEQYK53sbN4LBDXh4tMM+FP0fuQskoX83Y8hHGcfYBqlcWuXNG1vi6qljvpBTK1UZQTN/UqXBzvH/meCBVyUh5pBsSab4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWTcK6ml; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWTcK6ml"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso26856005ad.1
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123873; x=1792728673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=SWTcK6mlTespOusNMrVqRmrNuyI3yJHZ41HIRI9M2RQM3wqzAMKyhzPXyKt62tEwM4
         Rettv98CuFU9KUU7SnKoHG0496CGyYSJHM141302+uZvvzVSr3xWsAjd2N7T/y3//mT/
         rFoP3KyZX9CL/nKcLdY8SqwdYvmmsf/mCju5eHdCvMQLLXwZQB9srqPMYjyQ45Eb0bpW
         vW2gEQFJLqa2uAbZNITBboMpZK66VEm5RJTLT7DSHM4Gp7iSijFjEkg0c5YaQ0i4R6ck
         ePh0xbR9U9O03T1GiJU08h6nHpyPg95VtwdvPN6xUNTgu2ydFTMV0lZbUfn3LGNZo5YM
         9qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123873; x=1792728673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QXlahNE+Wx5snJLp/MKBjKZg6Q+5VrSpbj2QDx2YWrA=;
        b=uOkYKZUsx6g2b7zjaoKaUplW1Gn+yA9mlS3CnPtoQJPiw1Sn/sVpNeHy6dmPJlyKRw
         WO1gp/cONmkfpvzmmR3iH9T4O9sU7ErNXJWnhwzPfVrgqbZKuQlUwJWqfBcXF89AMqTn
         5I2J1Un1KZSwEKAYft5ENAa52hd9jkeLul12zJ5+pgA1IfC0/O0vYQ49vaT8cQkvtFZx
         z7W4gaZftvtZl3gyqgXyFronctGMlJqKArpy3ye1hhDiyIvFXSh90Hx/M4oJFo9DYmjy
         dopMrTFf16Uv9IAbfttdQpTvqCjlScDbPeJS/agTrEySI7IAL72CzRJrT636wX2BP6tN
         3Dlg==
X-Forwarded-Encrypted: i=1; AKwUvBw5hroyxLCyZBSeCwa+HVc7QyotYtwxfY/enf2nFOTUNX4DOb84/FuakExQEaPxy0cjIrJbZg3KbwXbLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJZeJ8gBeQtpvLWofgp68zS6289uue3XdH4Num4NMezbkdKh5Oj
	6Iji0WI//mrOkDDlDP8lCSiCcov6RyIML3yOuZn5ridVR1Zrigfhw5fj
X-Gm-Gg: AYBFou03FY8v/GnLLRqkDdwEAKnWKI4sNwSrYYurYj/0Fr7Ds3pTTUcpou3ybzcSFRl
	yJ3X0mjRrXeR6xUboobzxLUYWw9CXSYiiGVYE3iOghUfgsEOEqAHt4O7P8N+r8U3tN0MFUwsnoP
	g8hDPCG0wlm/WiK7mhDHohqmZrvKxQAAnYbP65iDb8zmyHRQJpDR1yxIqpwOibJU9VffJZ2ukFU
	wzdnRQkInOT/9DXwhqAH1fVWQooY5YRlHsWWP+zVb9oUY4XMpHGIF6gtYPie6po0PzmTvZnpo3A
	6pJA2gpTXDzr1+cHfJ5OhNqXjRZT1Vfw+Ay1jyo4SbPY9JN/pKT4qmLdLmhGM9mAQdQeBeC0VlN
	cpfsDUKwx8ZhaGMfxPqloHcvnaZmXGgm2HkSSPzvNT4efjPABf7ONVjyobi9Lfnav49Imig6suW
	j9uko4mYYett8wmclCA02VwgXYEe82ZsPAuALi7My50/E7Mahhf4gyyQcyiZ0e9Ew026kYaU6nC
	weYN9m1n1JAG9LfI+xULPPgtV6YWyd8LSp0kV48iObA4muqKnrszeH6pgS6Wy1mCSlBK4A7NyfB
	k3OPJ/rOvsOyYQ==
X-Received: by 2002:a17:903:19cf:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2e842ce7c78mr210820935ad.45.1792123873102;
        Thu, 15 Oct 2026 21:11:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8ab443sm3815785ad.65.2026.10.15.21.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:11:12 -0700 (PDT)
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
	bui duc phuc <phucduc.bui@gmail.com>,
	Chancel Liu <chancel.liu@gmail.com>
Subject: [PATCH 05/11] ASoC: imx-pcm-rpmsg: Explain component open return value handling
Date: Fri, 16 Oct 2026 11:09:40 +0700
Message-ID: <20261016040946.521195-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040946.521195-1-phucduc.bui@gmail.com>
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a comment explaining why .open() must return 0 on success
to ensure proper rollback handling and prevent future changes
from reintroducing the issue.

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 30e75fee5175..85b7c929a28a 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -269,6 +269,12 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	info->stream_timer[substream->stream].substream = substream;
 	timer_setup(&info->stream_timer[substream->stream].timer,
 		    imx_rpmsg_timer_callback, 0);
+
+	/*
+	 * ASoC only marks the component as opened when .open() returns 0.
+	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
+	 * return 0 to ensure .close() is not skipped on rollback.
+	 */
 	return 0;
 }
 
-- 
2.43.0


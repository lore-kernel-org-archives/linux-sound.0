Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530865;
	b=mm2Gt9vGVnf4WhUJgLRau2WoOOJp9kWZ5AISYdo4TMGksxLxJE0T5eCZ+fpGIZoVYxaA
	 u4Zhab7tBnjKKDvky0BLsrwfQCbjF3tcnWw8iKbT4lHqxKLGDhz4dz+H8cmK5qs3TsycO
	 nJ9icRYF2kO2+XphAnAJGHfIKHpH7CVyosaljwDoy71tZ9eEzjVLTs8uyXDCvvGB/wWsy
	 gDscaSfXLOrYanVEhrX7cr3n/FeNNIa13OGJRM2ODmVZNiKJSDLMCcCtNESnVJaLZSCLk
	 VArvGov0k6Nr6OG2cssmCTWltJ9GbnETWX1Dge5t9IhlxLaJdtXR3m4ytIH+iOrOgLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PO1LWnBmkq0Z96zIaqbjewDKRL7+dNozni30vAzm5yk=;
	b=Lvqz7zTZKupAHm78iiP270lpAa73t429GlSv5MaO99gOkfjbOfNUJ9sZZS3lGzFNMhLC
	 yBTUMxNxolPFIVCslXOfpBUpdcpEhO5w7+nUR5p2yfOAiJTJcujpnnBGR+h5mNbiX+JgZ
	 R5moi0IFf+p446DYdhJlJmHeDbxBq1gLtWpEyfSoyaEDUF9qvGFLm6Pdte28et7HnCRJk
	 O/9dXqkwY5Rnmj8U/WHLvzyn7hOhgIQY2TUI6ZIr2o44KZzY2mlpgjMhCV53u987lalZx
	 slw+PZqn/+OQmmybRpR16HEXMu3mbuZ+odfCZ3zxBkaVg7CagRCyp3xMhiaYYJuVz1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gg+70hQf;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F00606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 11:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6F00606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gg+70hQf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1106240f8f.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 03:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530863; x=1794135663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO1LWnBmkq0Z96zIaqbjewDKRL7+dNozni30vAzm5yk=;
        b=Gg+70hQfvpOnklGHksCfJxTEgFVo9bv05hhrcMI3cIIJasC6ESWo8ZipoyWbDl/cx7
         a1bz3PehsWkQAMmtJcjEAOiYVSX5/v23NyJBWPra650ix/mAo2MF/8HOFEKF4TGx/Oc7
         WfksR7MTWuR52QX+k+WAZZTih74iO2IpU1l2mYfgnLksPe/NSG9zNwe7IVTgzWraMQX5
         KJFQ/B4gwBTk46zwQUzM7/RMOjYRiy/fCFiFxzfRWKg9omjYqNYeMJpnMe+og8biU/0I
         SGBCDm+mDKngBA7ev0k2ZmCeY0ywbJgARpgpHzn60rnRN+4aOIv3bsAaKCAlVzw8CenU
         njTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530863; x=1794135663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PO1LWnBmkq0Z96zIaqbjewDKRL7+dNozni30vAzm5yk=;
        b=0RPAKOcPTbt27MmQX5Y/XHdHiKuAhr7PNWB68hjdDUQYuw33qwOOHhtCKanlZuved4
         VWUSn3iyBStBdLafjWXmPE9KvirkWBJopgn+KXa4K/rTJJJ9YX61unEeOX3MefscYKAQ
         PhBVBCoFfhUOVm55GUmJMOkMTrsAc3mwbOBoMLn36meox3Pi3uRmMlksb+fvzKF+0T61
         3VNC+jenvNoXhOoSfrz5Q5T+wbtOiOKxg4I35UnnuQrAHktxJvzaMwwJHGxcQIMYW7LX
         eSPAwAcOyQYWgRI8+6yfKOiH0sF78vW01KX0wUtM6n9q2YDJFvibCWjnYLRAC+J28j+z
         TEBA==
X-Forwarded-Encrypted: i=1; AKwUvBxgZ6fzuafIggYyt82r6CX0tR0EO3KK7u3Pj8JgsP+2s0e87Sd1vgRK2Q1yd80OYxjnvnb02VoyffbnRg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PeUx/e63pFqZJy1AoRtPi/dy+7hBzk31W9+4/3GSQwrccjQu1
	7avfHLfuk2+uw1I552B37Hm89YczxNaYf8+QvdFDImw9l0TPYqCmb+g2
X-Gm-Gg: AYBFou0hlijJB0tNYt7LOLoPRZnqzKqRvGEf9oHfFmrUDW/Ifk3YBR8iopSVuMrW4Xt
	7iqt+ExWXttZ4xG6RuZRJnTwjWTzBDJV3gPdGOfSQXdkxgzOnFXeGXENC9OkYG1GuVyMB1BG/+f
	bzYlh8TKiJRSKcpvLe27sfeKrGseOsYH+2uSpzlhRlLPbpikhXuVK1onVxaNJDy2yvbURagc0SG
	04CCOz3eKrjBtOHtTu0BZIyPSZBRUPzIkur8SPO1K83kE0YE1uNEYaVcw1DrncPkYHGWtZjdLZw
	3CgFEJcl3r/klkLy6JgQzImFg61q44/b2eigUR+kO4DpRzCMmpPfsMp8TW6Q5LUysHADDu0SHGd
	/AXnK+PfNRvO3IgnAELUKkML9B0zAR3Ov7X48Lu1S/38qJ103qKdYk1ifXTtgcZI9nr2cA2dNIM
	O/7ifB9ki/4VIbaAGq2bo9gvbaN9eJXcJzpKEbP4xDdpzzK18tC7qOpOqBrEuOCzknLHDlusUrV
	t6kCz6567BoUMiPyQnF3dXyenz/jX1wt9zZQETA9v0zp+jm+/MO/t/4VTxK/rjK1Kj1kEXs10xM
	PE/rK40FQJFyn2iH79+sohIJxjulXvQeLsw3opvQgSsdug==
X-Received: by 2002:a5d:6f08:0:b0:48d:f877:3349 with SMTP id ffacd0b85a97d-48e6e4f8cf7mr15679157f8f.42.1793530863051;
        Sun, 01 Nov 2026 03:01:03 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:4773:6f00:1f0e:d397:58dc:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm12388432f8f.28.2026.11.01.03.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 03:01:02 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH v2 2/4] ASoC: rt711-sdca: handle HID button read errors
Date: Sun,  1 Nov 2026 13:00:58 +0200
Message-ID: <20261101110056.423353-6-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101110056.423353-5-thnkslprpt@gmail.com>
References: <20261101110056.423353-5-thnkslprpt@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rt711_sdca_button_detect() returns zero when a regmap read fails,
so the jack handler cannot distinguish the error from a valid
no-button result.

Return the original error and make the button result signed.
Skip button reporting on read failure, but still report jack
changes and clear button state when the headset is removed.

Fixes: 7ad4d237e7c4 ("ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
Changes in v2:
- report jack state on button read failures regardless of SDCA_0, preserving the original jack reporting behavior

 sound/soc/codecs/rt711-sdca.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 9781f289f8adc..f6c8377c51ab5 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -184,10 +184,10 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	return ret;
 }
 
-static unsigned int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
+static int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
 {
-	unsigned int btn_type = 0, offset, idx, val, owner;
-	int ret;
+	unsigned int offset, idx, val, owner;
+	int btn_type = 0, ret;
 	unsigned char buf[3];
 
 	/* get current UMP message owner */
@@ -195,7 +195,7 @@ static unsigned int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
 		SDW_SDCA_CTL(FUNC_NUM_HID, RT711_SDCA_ENT_HID01, RT711_SDCA_CTL_HIDTX_CURRENT_OWNER, 0),
 		&owner);
 	if (ret < 0)
-		return 0;
+		return ret;
 
 	/* if owner is device then there is no button event from device */
 	if (owner == 1)
@@ -259,6 +259,9 @@ static unsigned int rt711_sdca_button_detect(struct rt711_sdca_priv *rt711)
 			SDW_SDCA_CTL(FUNC_NUM_HID, RT711_SDCA_ENT_HID01,
 				RT711_SDCA_CTL_HIDTX_SET_OWNER_TO_DEVICE, 0), 0x01);
 
+	if (ret < 0)
+		return ret;
+
 	return btn_type;
 }
 
@@ -330,6 +333,17 @@ static void rt711_sdca_jack_detect_handler(struct work_struct *work)
 	if (rt711->scp_sdca_stat2 & SDW_SCP_SDCA_INT_SDCA_8)
 		btn_type = rt711_sdca_button_detect(rt711);
 
+	if (btn_type < 0) {
+		unsigned int mask = SND_JACK_HEADSET;
+
+		if (rt711->jack_type != SND_JACK_HEADSET)
+			mask |= SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				SND_JACK_BTN_2 | SND_JACK_BTN_3;
+
+		snd_soc_jack_report(rt711->hs_jack, rt711->jack_type, mask);
+		return;
+	}
+
 	if (rt711->jack_type == 0)
 		btn_type = 0;
 

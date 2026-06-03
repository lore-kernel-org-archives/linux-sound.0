Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DF379C57;
	Wed,  3 Jun 2026 09:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477912; cv=none; b=AFh6I/B7a3vjTHGm3r+EbpkOEHRCCWGsM3pccqR1/ziBgoWDDDtHnkqYmlXJEA+40Ds5c05YIDuoWY93QatNT36wVX4d9caVzCsiAwcFL53607xOvT8pw45OaBkoUEVR3BQWJU9S0hHVOwdIwpTq3FN851XE5QRrBq6S50f6POM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477912; c=relaxed/simple;
	bh=hr7LLAD3FpvjBZy7+94jIxVuxYp+UDgjrV3bVLYppRY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aD5MCX6yXkjftCuwRFzuC+lPp8CG/26tcV1/KjVBflCeoU3/CYm0jGxGm5QxDtevgbDhcuiKEooC2hNwbwYGBFxGq3KD/yZLqCGcrKfew9G3iAufgYAHl3cuWZg/wmYVoS0CH/u7fQy6KcfBsm1RE7RKozhxplxd10+dMGrejBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=n8A3v7VV; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="n8A3v7VV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=li
	7v7HMxiepv/i5p7PCAVKBdhUC9sw6mHdZlyQ6aTkk=; b=n8A3v7VV6ORTs7aI9K
	FFqVUwGQm+DWsI5frgDOcitnmkkd+MKdCUuqXeX7qhLvA5bpnlfpgS9XMbjgUBdN
	N+l6hzILI9XYWI5pw83uP+T84MqjWVQMB8qehPmkoQyKZi6zMuG8R1nzsjmefbDt
	bBdTUYNrlmNJkskFiewqETBN0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wB3Vqao7x9qFpvVBA--.45986S2;
	Wed, 03 Jun 2026 17:11:05 +0800 (CST)
From: wangdich9700@163.com
To: tiwai@suse.com,
	perex@perex.cz,
	wangdicheng@kylinos.cn,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ALSA: usb-audio: qcom: Improve error logging in USB offload
Date: Wed,  3 Jun 2026 17:10:59 +0800
Message-Id: <20260603091102.231370-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wB3Vqao7x9qFpvVBA--.45986S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw4DGF1kGFyxJF1rXF1DZFb_yoW8Gry3pr
	s7uF48GF1xJa45Ar18Aw4Uuw1Fqw4DZFW7t3yxu39Fyrnxt3WkX34UJ34I9F42gFZ7Kayj
	qFWvv34rArs5KaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEmiinUUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC6AqI12of76qS1gAA3J

From: wangdicheng <wangdicheng@kylinos.cn>

Add error codes to error messages for better debugging.
This helps identify the root cause when USB audio offload fails.

Error messages now include the actual error code returned by
xhci_sideband operations, making it easier to diagnose failures
during USB audio offload setup.

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/usb/qcom/qc_audio_offload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
index a0009503b2c5..f99f8bddb237 100644
--- a/sound/usb/qcom/qc_audio_offload.c
+++ b/sound/usb/qcom/qc_audio_offload.c
@@ -1140,7 +1140,7 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	ret = xhci_sideband_add_endpoint(uadev[card_num].sb, ep);
 	if (ret < 0) {
 		dev_err(&subs->dev->dev,
-			"failed to add data ep to sec intr\n");
+			"failed to add data ep to sec intr: %d\n", ret);
 		ret = -ENODEV;
 		goto exit;
 	}
@@ -1148,7 +1148,7 @@ uaudio_endpoint_setup(struct snd_usb_substream *subs,
 	sgt = xhci_sideband_get_endpoint_buffer(uadev[card_num].sb, ep);
 	if (!sgt) {
 		dev_err(&subs->dev->dev,
-			"failed to get data ep ring address\n");
+			"failed to get data ep ring address: %d\n", ret);
 		ret = -ENODEV;
 		goto remove_ep;
 	}
-- 
2.25.1


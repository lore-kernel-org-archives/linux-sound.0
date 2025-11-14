Received: from mail.kh.edu.tw (mail.kh.edu.tw [163.32.250.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90780132117
	for <linux-sound@vger.kernel.org>; Fri, 14 Nov 2025 05:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.32.250.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763098484; cv=none; b=D91fNRcEGHUoKUrA8IKgLGR12poQLpAj+pu9VZlBBA1Ly66EFDoYk5kbZn3pzXNiW3PHeBgJmS76ZKlgqKthfp5SAjNsHzBrZMEfbhJVh8sgdZ1x3TFtxJvz03WZDU0nY2w6Oli1Vt+jDArqusbKZdK/FWpM81TClcXNCb8nbwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763098484; c=relaxed/simple;
	bh=TYcx5/EwBUcYOKiHJZupqbtMavY5tJRq1LkHPxE5W/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLzgckL8BiiRVQ4hj4PeufIqQAzSj+GIG2tyjtVbXA62rB4l+w8PBVWjKVnNmzASF3iMBbHoRaJwXuGjGky96Uar+Ogof0c4M7RmBemnt8apkwbeNVRO6GynjvWoQxmUvZKuLm63Wunar+WCO50hQgsalGTxKtsPJbV3zafu6hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.kh.edu.tw; spf=pass smtp.mailfrom=mail.kh.edu.tw; dkim=pass (1024-bit key) header.d=mail.kh.edu.tw header.i=@mail.kh.edu.tw header.b=wVO5IkC0; arc=none smtp.client-ip=163.32.250.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.kh.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.kh.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.kh.edu.tw header.i=@mail.kh.edu.tw header.b="wVO5IkC0"
Received: from myDesktop.awareit.home (2001-b011-c008-7216-1c0c-1d8a-cbd3-4c7d.dynamic-ip6.hinet.net [IPv6:2001:b011:c008:7216:1c0c:1d8a:cbd3:4c7d])
	(authenticated bits=0)
	by mail.kh.edu.tw (8.16.1/8.16.1) with ESMTPSA id 5AE5KreG1037749
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 13:20:54 +0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.kh.edu.tw 5AE5KreG1037749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.kh.edu.tw;
	s=default; t=1763097655;
	bh=TYcx5/EwBUcYOKiHJZupqbtMavY5tJRq1LkHPxE5W/w=;
	h=From:To:Cc:Subject:Date:From;
	b=wVO5IkC0XDaR4ivMPaSRP6GYICIq42Uk/vMC2CbdQyqcyPXAHMd6xSbBi8WsrHSqN
	 oJgfFJLu0dWPvqh/Ep1so3qmMUZIvYSE1S+7U9n7tP6M7703fsXfcnSUilE7eWIlsF
	 T4LWJqhb2mxOzm+sBStDkcqoCt2JOLe1nPuOoPuw=
From: Lushih Hsieh <bruce@mail.kh.edu.tw>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Add native DSD quirks for PureAudio DAC series
Date: Fri, 14 Nov 2025 13:20:53 +0800
Message-ID: <20251114052053.54989-1-bruce@mail.kh.edu.tw>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (mail.kh.edu.tw [IPv6:2001:288:8201:2:0:0:0:21]); Fri, 14 Nov 2025 13:20:55 +0800 (CST)

The PureAudio APA DAC and Lotus DAC5 series are USB Audio
2.0 Class devices that support native Direct Stream Digital (DSD)
playback via specific vendor protocols.

Without these quirks, the devices may only function in standard
PCM mode, or fail to correctly report their DSD format capabilities
to the ALSA framework, preventing native DSD playback under Linux.

This commit adds new quirk entries for the mentioned DAC models
based on their respective Vendor/Product IDs (VID:PID), for example:
0x16d0:0x0ab1 (APA DAC), 0x16d0:0xeca1 (DAC5 series), etc.

The quirk ensures correct DSD format handling by setting the required
SNDRV_PCM_FMTBIT_DSD_U32_BE format bit and defining the DSD-specific
Audio Class 2.0 (AC2.0) endpoint configurations. This allows the ALSA
DSD API to correctly address the device for high-bitrate DSD streams,
bypassing the need for DoP (DSD over PCM).

Test on APA DAC and Lotus DAC5 SE under Arch Linux.

Tested-by: Lushih Hsieh <bruce@mail.kh.edu.tw>

Signed-off-by: Lushih Hsieh <bruce@mail.kh.edu.tw>
---
 sound/usb/quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 71638e6dfb20..999122b76351 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2022,6 +2022,8 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	case USB_ID(0x16d0, 0x09d8): /* NuPrime IDA-8 */
 	case USB_ID(0x16d0, 0x09db): /* NuPrime Audio DAC-9 */
 	case USB_ID(0x16d0, 0x09dd): /* Encore mDSD */
+	case USB_ID(0x16d0, 0x0ab1): /* PureAudio APA DAC */
+	case USB_ID(0x16d0, 0xeca1): /* PureAudio Lotus DAC5, DAC5 SE, DAC5 Pro */
 	case USB_ID(0x1db5, 0x0003): /* Bryston BDA3 */
 	case USB_ID(0x20a0, 0x4143): /* WaveIO USB Audio 2.0 */
 	case USB_ID(0x22e1, 0xca01): /* HDTA Serenade DSD */
@@ -2297,6 +2299,10 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_IGNORE_CLOCK_SOURCE),
 	DEVICE_FLG(0x1686, 0x00dd, /* Zoom R16/24 */
 		   QUIRK_FLAG_TX_LENGTH | QUIRK_FLAG_CTL_MSG_DELAY_1M),
+	DEVICE_FLG(0x16d0, 0x0ab1, /* PureAudio APA DAC */
+		   QUIRK_FLAG_DSD_RAW),
+	DEVICE_FLG(0x16d0, 0xeca1, /* PureAudio Lotus DAC5, DAC5 SE and DAC5 Pro */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x17aa, 0x1046, /* Lenovo ThinkStation P620 Rear Line-in, Line-out and Microphone */
 		   QUIRK_FLAG_DISABLE_AUTOSUSPEND),
 	DEVICE_FLG(0x17aa, 0x104d, /* Lenovo ThinkStation P620 Internal Speaker + Front Headset */
-- 
2.51.2


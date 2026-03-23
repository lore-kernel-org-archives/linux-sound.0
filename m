Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA11E3A6B88
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774273597; cv=none; b=cYtMZQE6OXdGereoTo1dwt60/z6741Rg82On/tkFlSutmRnxPbpuVRr6HGdLqjAYVGdVDGdgJdOcMpfr8ByE1mJSg8hQ8QlBWuGNTijHc7rmmGuhd+72VFAUXMMO63dpmWC4aIAQYIz4PGgdx/W7eTGd7qDe2eOdUwgaoafXpnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774273597; c=relaxed/simple;
	bh=WkuXuGvYi+rwdC2pwi/jwhbKRa0NlwcPYaaCiNAJ+8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PdX77T5Bi8RXfSFx5e8IZryrNAVCYkf7ApsX3rHQFaxV3v0+/Yxi1lnUKFEU9V98pDqfOYJxv7HkkGLdoKQfG5yhceqclai7dZp+HmDNes2Qx3oZnWc1uwZ2RCTJ5ys00orm8YOUf/X2w0Sjb22altZcxrbG4fTLLOUKVCSHuAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgkaO6pp; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgkaO6pp"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12a693cdf29so3083782c88.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273595; x=1774878395; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQHAZFcduEeHbHtvUpAgVP11tHY9/KEPNmFMJgQ/yLI=;
        b=WgkaO6pp4YN6eNFKPZsRXuvX3lC7v+tuo5DuyXR5DF4xr6x7+TXpK27WJo1FvzyvAF
         GH9kJXx8TndRw6GXQ8qNlWugyOCZpt8jhlSC/9MAHC0s/75Q/bq4mHJhrV9AhpNRxZCT
         pgYpABOXthCo90BZz5j6xBA+xmJI7vSrJ8qciNwnjD1GbT4Kn6w5imVAF9aahysWd3Mg
         svf0dDuR4wqccpWIBbJYlRD8++Pl4pankaax7iVVgW6vUZi5yo56Lc4yOFI07OkbGdfM
         dIS/M9VHBhzvtPXrmST11QlFVg6XeM+L79b82L55agDLDA9hnwJNmNl91Qb0gpJIc+Fs
         OfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273595; x=1774878395;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQHAZFcduEeHbHtvUpAgVP11tHY9/KEPNmFMJgQ/yLI=;
        b=N+ZGUatTcM++cdn4TS4qOYU756tzcgieVTMWNnYW3noyCddugvBAuiTH0U4EHj24x/
         adcnh84dKG/OA9LxRt55r5smGVbthNVzvQZGUjwkqkFhCweJ4b3bQ9mv7MsCPyc9cwiG
         Bc5wmAIAAC+7XZu3l95/p9TxLJRBDP8a6JH36kTsTLs+d/SWXSda2tpZemF2VbvtYBj2
         VFguxa+xrhciNStaDW4pnY7dFfQw6emXi2phJs4UcW3w9SnkoaxprgX1ocebZTtiHQRr
         3JNXTdWihVDePUuswFCS38ZoE9zKM8ktc7N2faY5g2r7qeCSzXenjPcXkf2W6G4YrsJG
         HSQw==
X-Gm-Message-State: AOJu0YyS40ChXMIbmAnyOqpBrgV9aABGexb/1w7Hs4rDIy6lp3PPTJfd
	fldhKCsLgx/ccUvl7YTiTuYp7TsoQGEzPoljfJg4ktnz/7/L0cM+IbAQ
X-Gm-Gg: ATEYQzw8MGmhhzfExoszZT9eMZH3SLpj5Hfb9sW2/+IESZ8iGg7OY6AHKaT+Kq/KBBK
	j3yZAMMIRQMZiDPoNjH6DqfkQd+MOgyONRmBnRtky6oms5Ouac7NoSig9Eq6+CCpwjP89YZa68t
	Mh/0OxNAG1gqHv/POeMLCTXpYnuUI8LYwtO6ldZ3AKkhgsV1lYric22X+SV7CEXXf6GxZBNdmIs
	27WQWMfjeEKz8Koo63oWjoq7Xod3nUNTL/efZeUz1zj1bv3HC+arD6A1vsiLH6zFktxCwO5IwaJ
	O5AnIIoFppUkW2fnLzeaDNqVOnY1fJZjp/9+SaW0Gld9J9K0mYC2pLQe/Qe4VLUCKWfmvtaQo8Y
	w3MzQz+sqqYoLmfyJ2aMolV1QY1MSLNdBcbqNqXSY14ervI7z6/BrYvoxesl7/SOKGyxiqx3HSH
	wIvqKcVR57PTsRMp3birr4LT9fwB17Z1b/t+h2WLGmQ8pyYmkXCKuNAaxd05+WMq8Eh1SZSABvQ
	IU=
X-Received: by 2002:a05:7022:6894:b0:128:cdb7:76e1 with SMTP id a92af1059eb24-12a72326a69mr4292688c88.13.1774273594672;
        Mon, 23 Mar 2026 06:46:34 -0700 (PDT)
Received: from [192.168.1.8] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a736cf7e1sm8815132c88.15.2026.03.23.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:46:34 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 23 Mar 2026 10:46:24 -0300
Subject: [PATCH] ALSA: usb-audio: rotate standard MIDI output port scan
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260323-usbmidi-port-fairness-v1-1-2d68e97592a1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQ6DMAxA0asgz1hKYsrAVVCHtDjUA0lkF4SEu
 Hujjm/4/wJjFTaYuguUDzEpucH3Hbw/Ma+MsjRDcGF0FAh3e22yCNaiX0xRNLMZDuT8g4gT+Qi
 trcpJzv93ft73D4bXqqhnAAAA
X-Change-ID: 20260323-usbmidi-port-fairness-4301533ef31a
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=WkuXuGvYi+rwdC2pwi/jwhbKRa0NlwcPYaaCiNAJ+8U=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkHXSyWt9YvlVuVsrFeSGDhpy6nh2sZX4b+uKJu2Mn0w
 /fzlGu3O0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiWiKMDLe9IxS8Hlg2ZYn9
 7hRUsbc4l+3yvU+ydgfjOgvZnqzFSxgZ3ivcs5t74oT7k7SXs5V/lbn8uCOeuLT7yIeax4sVL0m
 2cwAA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_usbmidi_standard_output() iterates output ports in ascending order
and drains each active port until the URB is full. On interfaces where
multiple USB-MIDI cables share one endpoint, sustained traffic on a
lower-numbered port can consume every refill before higher-numbered
ports are even examined.

That behavior dates back to the original implementation and still
applies with the current multi-URB output path. snd_usbmidi_do_output()
can refill several idle URBs in one pass, but each refill restarts the
scan at port 0, so a busy lower-numbered port can keep higher-numbered
ports from making progress at all.

Use ep->current_port as the starting point of the scan and advance it
after each URB fill. This keeps the existing packet formatting and
per-port state handling intact while preventing persistent starvation of
higher-numbered ports.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/midi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index a8bddc90c0ed..0a5b8941ebda 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -699,15 +699,18 @@ static void snd_usbmidi_transmit_byte(struct usbmidi_out_port *port,
 static void snd_usbmidi_standard_output(struct snd_usb_midi_out_endpoint *ep,
 					struct urb *urb)
 {
-	int p;
+	int port0 = ep->current_port;
+	int i;
+
+	for (i = 0; i < 0x10; ++i) {
+		int portnum = (port0 + i) & 15;
+		struct usbmidi_out_port *port = &ep->ports[portnum];
 
-	/* FIXME: lower-numbered ports can starve higher-numbered ports */
-	for (p = 0; p < 0x10; ++p) {
-		struct usbmidi_out_port *port = &ep->ports[p];
 		if (!port->active)
 			continue;
 		while (urb->transfer_buffer_length + 3 < ep->max_transfer) {
 			uint8_t b;
+
 			if (snd_rawmidi_transmit(port->substream, &b, 1) != 1) {
 				port->active = 0;
 				break;
@@ -715,6 +718,7 @@ static void snd_usbmidi_standard_output(struct snd_usb_midi_out_endpoint *ep,
 			snd_usbmidi_transmit_byte(port, b, urb);
 		}
 	}
+	ep->current_port = (port0 + 1) & 15;
 }
 
 static const struct usb_protocol_ops snd_usbmidi_standard_ops = {

---
base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
change-id: 20260323-usbmidi-port-fairness-4301533ef31a

Best regards,
-- 
Cássio Gabriel <cassiogabrielcontato@gmail.com>


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A8A35E549;
	Wed, 12 Aug 2026 00:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786495456; cv=none; b=nkY3ZzPmf9Qs+jza695PPr6ODYwhiyqVykbE4AbABcbG2zgn6S0fzX2TxRoQoOCsswEw7M4YI+N1McbOKd3WWpzNR6rN6hTQ6NXkicxrgBIYP/8O0jzcR38c0fqLia9RbiSrhyioA57l8Tv5AnDBpk0YrNrfhL07CBMfNySR7o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786495456; c=relaxed/simple;
	bh=C1N3V2wJq15d10Pk83+/UVgIWtp+1UNHphFnXeVp5vQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ulH3Z22Hw3MwDuv0dfEa988QRTJSlKfhacbHEMhxk7oBGCN0NgRrLSyJjphwuD9DFI0CZdBz5kd1ZGQHG3V6jaSw2G4ak0nMB2Ls9Py+ZroVmQJi3rAh2n0BF+/SZ6cU/HQnelDYIVTV+66iyPRn06naPAOCsjckbrxZ5kJo5GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjlQ1j5l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjlQ1j5l"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDA78C2BCC7;
	Wed, 12 Aug 2026 00:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786495455;
	bh=C1N3V2wJq15d10Pk83+/UVgIWtp+1UNHphFnXeVp5vQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OjlQ1j5lv7fC+R3KxBDBdDuctBUIO7EKBb7RZChvDnBY8hkzkkjPPuzidthhXCGkb
	 HukVO/FF0Ik+z2CLwwiJm4QWOyOGt+o2X/xHR0QGDSlrOMNuZVNPLpDwjs+Ph6CLPI
	 iZ63WRYOPP+zObyzbryf5idocrcm7j8NdFnBV8icl7gUIQa9vvOzDrnJz7BLZPkFkc
	 jrAP3uwzATzjAoCi0qVefmDAKpYvOa+mSiqHaWiEb1g/qOean5vHVA5Fg9qGIQRLSu
	 DKRYsusRChkPAEw3iavsDXrSmyOz7sTIPcHxBQFyECQh7Uh6Wa1j2trvvqgqXi021N
	 u+q/eM6AIiXgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D61C5CFCF;
	Wed, 12 Aug 2026 00:44:15 +0000 (UTC)
From: Trevor Vorhees via B4 Relay <devnull+vorhees-work.proton.me@kernel.org>
Date: Tue, 11 Aug 2026 20:44:10 -0400
Subject: [PATCH] ALSA: usb-audio: Fix sample rates for PreSonus AudioBox
 USB
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-audiobox-usb-fix-v1-1-13c8b7f071ea@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqEMBBF0a1IjbsgibS/rTQOEi21HBhJGRHEv
 Rvb4Xnw7glCgUmgyU4ItLOwXxL0J4NusstIyH0yGGUKVWmNNvbsnT8wisOBDzTKDvW3zolMCem
 2BkrzP/lrX0t0M3Xb04HrugE6d+HYdAAAAA==
X-Change-ID: 20260811-audiobox-usb-fix-20af9593ee27
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, 
 Abhinav Mahadevan <abhi220204@gmail.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786495455; l=2050;
 i=vorhees-work@proton.me; s=audiobox; h=from:subject:message-id;
 bh=l8HNN0FiikEfBKzUrr9nL6yHOYFf/Ri6waOiekc5h3E=;
 b=sqW0ZUmJEBAU7wkM6OyXVmUTi81pbBw+VZk352fbWQqspQYOORCA24A0RwobB+ef6P2/rw0fe
 w2oca1x3jrRC2V4AieDyd7tzbEZ8uE/nucwzpXkt/wiLBONWUFmrkPL
X-Developer-Key: i=vorhees-work@proton.me; a=ed25519;
 pk=TmdvK8GsvZOb51T6DVhj7yKhGOofzmPnu20FNaeLwLg=
X-Endpoint-Received: by B4 Relay for vorhees-work@proton.me/audiobox with
 auth_id=940
X-Original-From: Trevor Vorhees <vorhees-work@proton.me>
Reply-To: vorhees-work@proton.me

From: Trevor Vorhees <vorhees-work@proton.me>

The fixed audio formats for the PreSonus AudioBox USB specify a discrete
rate mask but leave nr_rates at zero and rate_table unset.  find_format()
therefore rejects every requested rate, preventing the playback and
capture streams from being opened.

Add the advertised 44100 and 48000 Hz rates to both streams and report
their 24 significant bits.

Fixes: 34fe4a9df247 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")
Cc: stable@vger.kernel.org
Signed-off-by: Trevor Vorhees <vorhees-work@proton.me>
---
Tested with a PreSonus AudioBox USB (194f:0301) on Linux
7.1.8-zen1-3-zen. Playback and capture streams opened successfully at
both 44100 and 48000 Hz after applying the patch.
---
 sound/usb/quirks-table.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 71444c28..9a28d7c6 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2692,6 +2692,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 			{
 				QUIRK_DATA_AUDIOFORMAT(2) {
 					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.fmt_bits = 24,
 					.channels = 2,
 					.iface = 2,
 					.altsetting = 1,
@@ -2703,11 +2704,16 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 						 SNDRV_PCM_RATE_48000,
 					.rate_min = 44100,
 					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					},
 				}
 			},
 			{
 				QUIRK_DATA_AUDIOFORMAT(3) {
 					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.fmt_bits = 24,
 					.channels = 2,
 					.iface = 3,
 					.altsetting = 1,
@@ -2719,6 +2725,10 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 						 SNDRV_PCM_RATE_48000,
 					.rate_min = 44100,
 					.rate_max = 48000,
+					.nr_rates = 2,
+					.rate_table = (unsigned int[]) {
+						44100, 48000
+					},
 				}
 			},
 			QUIRK_COMPOSITE_END

---
base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
change-id: 20260811-audiobox-usb-fix-20af9593ee27

Best regards,
--  
Trevor Vorhees <vorhees-work@proton.me>



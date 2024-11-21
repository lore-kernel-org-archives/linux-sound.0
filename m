Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004C1CD3F
	for <linux-sound@vger.kernel.org>; Thu, 21 Nov 2024 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732197984; cv=none; b=hddkVbJ0K45O40ybPh7794fPNwV4Lk+y1UEpoZtlGB8gymvXjw0ZtTB7R3SxOwYTIjsdOYWpiXCtQ32cS2HqIvvBt3gzmswG8VCyyJ6uum97tcSA3l5caICVKE2L32lLSpQHPB3xK+HiF5n9fLE9gtu7+GIUskJgoC7xacdmRlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732197984; c=relaxed/simple;
	bh=2VyltvEBctluWwpe6IGONt7KdaVKeze3snGxDEeS9uQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=adm/lbGfbdoSXX0S5FMg/6zzlNf/yUn+LZ2I1l882j6qiqi0wfnjyfo4IxtRnUUPnp4BXvq/LyVce6WRmkPzPkHbYgrxMT6DVuv6DxZEbFxnRmrzkkp05JJtmoU48ZnmgHgDybid3mpfFVx4ZmLedKGml33c5zZ8QNSOfk54I9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A+8izaFP; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--bsevens.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A+8izaFP"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5cfd063f65fso268384a12.0
        for <linux-sound@vger.kernel.org>; Thu, 21 Nov 2024 06:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732197981; x=1732802781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EuPKqcOmbOZ3mVlm7UZQOj621k72xz1hIN5dvaSPDjk=;
        b=A+8izaFPJ3vJa4ysbRngj7GTO/Tsy2IalfQFUlcZQ1MiITuUeN10EcI46QnKFBpJx2
         c0a4OqmrKXk171zrW8bUh8NvAFgSRxMcDWxyozBjXM67t2X3fMCmXpDh9eYDBsiDLDKM
         qdHs59IACZwM72Fx3batbDlgkJpUWDPbzmZNTjlBWrDOP2HEfOMcYiyROqhO8aLo2lJA
         IiUDCP+OfwyLCwYJGNxe0OhBnfp1urduJAB7wfqP2twN4fSj4zzIhAkCuhaKGG9G9AvH
         mGc2vzyutplBV546Vmb7X2n5jx2Ue7JbHZ5JGT3h/6WpNvb2KCEOV0oc5hFp1avThqhy
         QnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732197981; x=1732802781;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuPKqcOmbOZ3mVlm7UZQOj621k72xz1hIN5dvaSPDjk=;
        b=duhe8yvnQUvhiQA0jr9hOLH5Cpzwv8v4O1gP16Pz2h3sfRyYcB8JDQkbvkWC5OOltJ
         WKZSgLtEzgN5VD+sJ3uT90aaH5FcLa5hahsLO74c8Bxf2tREa0wG5Tx6DzNSL5NvUKcN
         qAzbGx+IJiaraPMB8kKzlOlcNPHdxv70C3w4t9+8uiG3u9Sc0E7xMgwhL/9Nuh4u+I51
         Tj+9K3x1j1fKrO1NH2yNkWRNzRDCDRkKbcGq72u9XOAFubxIYWrrobLgNmbwhip1qtGd
         6yANUgSND7DpfeeaFnxvB2uUPxwEMDNmQ+NK9b8Co2L/dgCR3N8VPB0Mc3vARzvpMdJU
         DMyw==
X-Gm-Message-State: AOJu0YzN7DXe/5I11+4icvICaAnnA1Raz2pjqMuOsNlnU5i3xBTYcaso
	xaMy3SEYkCGYoFROOEdismqmzbvz3TW1hN/57XnUL2Tk/qEm15e9UItEnfiyV60UwdG87T1ykuJ
	RV99NyA==
X-Google-Smtp-Source: AGHT+IG8s0cFJZEQ7iF66kEJNkmG3nlLRFYthBkBweYZTgBNHtjNFb4652Dx6Ec0HbXE5ZTB4ZgpjXrktM7b
X-Received: from bsevens2.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:332])
 (user=bsevens job=sendgmr) by 2002:aa7:d90d:0:b0:5cf:aae9:ac4f with SMTP id
 4fb4d7f45d1cf-5cff49fbe0amr1806a12.0.1732197980862; Thu, 21 Nov 2024 06:06:20
 -0800 (PST)
Date: Thu, 21 Nov 2024 14:06:13 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241121140613.3651-1-bsevens@google.com>
Subject: [PATCH] ALSA: usb-audio: Fix out of bounds reads when finding clock sources
From: "=?UTF-8?q?Beno=C3=AEt=20Sevens?=" <bsevens@google.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, 
	"=?UTF-8?q?Beno=C3=AEt=20Sevens?=" <bsevens@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A bogus device can provide a clock selector descriptor that contains a
bNrInPins that is larger than the actual size of baCSourceID. This can
lead to out-of-bound reads in __uac_clock_find_source. These out-of-bound
values can be leaked back to the device via the uac_clock_selector_get_val
calls.

Fixes: 79f920fbff56 ("ALSA: usb-audio: parse clock topology of UAC2 devices=
")
CC: stable@kernel.org
Signed-off-by: Beno=C3=AEt Sevens <bsevens@google.com>
---
 sound/usb/clock.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 8f85200292f3..94fb628f116e 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -270,7 +270,7 @@ static int __uac_clock_find_source(struct snd_usb_audio=
 *chip,
 	union uac23_clock_source_desc *source;
 	union uac23_clock_selector_desc *selector;
 	union uac23_clock_multiplier_desc *multiplier;
-	int ret, i, cur, err, pins, clock_id;
+	int ret, i, cur, err, length, pins, clock_id;
 	const u8 *sources;
 	int proto =3D fmt->protocol;
 	bool readable, writeable;
@@ -301,11 +301,19 @@ static int __uac_clock_find_source(struct snd_usb_aud=
io *chip,
=20
 	selector =3D snd_usb_find_clock_selector(chip, entity_id, fmt);
 	if (selector) {
+		length =3D GET_VAL(selector, proto, bLength);
 		pins =3D GET_VAL(selector, proto, bNrInPins);
 		clock_id =3D GET_VAL(selector, proto, bClockID);
 		sources =3D GET_VAL(selector, proto, baCSourceID);
 		cur =3D 0;
=20
+		if (length < sizeof(selector) + pins) {
+			usb_audio_err(chip,
+				"%s(): invalid number of input pins for descriptor size, id %d\n",
+				__func__, clock_id);
+			return -EINVAL;
+		}
+
 		if (proto =3D=3D UAC_VERSION_3)
 			bmControls =3D le32_to_cpu(*(__le32 *)(&selector->v3.baCSourceID[0] + p=
ins));
 		else
--=20
2.47.0.338.g60cca15819-goog


Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDE222A7F0
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 04:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785385211; cv=pass; b=Aq6EtbXqItZcNcSA24ItQqQ1pd7K5RY0ypplZ40fneeQXl3JpJ+E8Whh7FuXmO93skXAlYpRFr/V22ZYHY3ZtY7dsefJ+/YtRKdvf4aw6lJK7ybAWKC/ug+oGpQuSIlBUnZViaI0+OYLvHy+YjGLgDYEemIfo1IAZvnMBD+UPtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785385211; c=relaxed/simple;
	bh=W+yqcwq0zff+HAKrCQbRx8KF/mvjP0Kp/J1fb4ikRTU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=aeyOGOklK1sYAsQGQoiyKYt5y2LyRAybdCNEWxjTqqLUjuz9HjtKCUolACIet7WHXxtRRWvRMA0M66fdDnEoLTwqXQ1cGAu9tTzSqV7EJ1//30MWBe789jy6XhmXCV4mzY4LHwSRZ0vpkAnGyDyfBswERAjrs2mW8VFj1+6HuM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMFsfaOA; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMFsfaOA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38cfcb507a3so139984a91.0
        for <linux-sound@vger.kernel.org>; Wed, 29 Jul 2026 21:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785385210; cv=none;
        d=google.com; s=arc-20260327;
        b=c3RbliJEUhxswGB1Itg4tEthxXUvMhjtVVvQ7qA2u9EZDGEeyX6dQxnYxrWPp0RRhi
         QDUpbB/sQ2nvV59O1W0Y5SihFI7lBvKWNOkbCUfYTbxivVhlOF+5uZBZqN3CrpFyrIWu
         LbHx/pp/LfE+ybhcGduF1BSI5iclga2iQh8JvR75ZYmBxvphflmqwMaM0M9fqlOO167U
         3v6EoOg4gfxP+GInS8x+lFEDfiYaWUB/IrgIrMC2g/8J/9xT6JQEHO7/Vjne/zCMkwux
         ielpMvWmklGn74E6nsNG4v3ZV4oHtpGimzPEkSyjLIb5lQOcx5XGjnxeaKBHGvQ44Y93
         ia7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=azv2+HA7vkhRDpwslh4d7gUmm4xOpVdOQXO9Gfi01QQ=;
        fh=KNb6RJXowCM04WgCv/nN3QHkXvqGhKXTYKB/Jcp2WqE=;
        b=YUV08d/Q0caK1loggOYc9c08zKZiU0qAycXtAiLaqcOzl7KpXuMxcuV0olellA1a0k
         D2MGmo71cu3UbTsu4TwGqSQG7djQasM4HtpMEfX/WI4tqCpIhfGH39CHAyQUZhW863Y3
         AzQIpu+xbrIWBI0WSF2W7846gmb+rCb6ZnWQJmCe8QWtpVSIBAMVuSnAu04X8+CAOyXM
         5FOciWbwI3ELrZVNqem3maozzQHh7N2LGhySxEEodatYrXkSyRK6qmdzszbMn5pGXZm5
         u3pu1l9xeANSnwzd89xvrWOSAlgqALnp1N0WOwcUSqSbmG8C+MWpXkWlqKX0GoBzF0au
         PZgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785385210; x=1785990010; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=azv2+HA7vkhRDpwslh4d7gUmm4xOpVdOQXO9Gfi01QQ=;
        b=CMFsfaOASyaazbnHEN6hvEemA/1HP9DupQmZ26z9qpucOWk3sjtXwUd99YqYmwy1q4
         acNl8D4inZyhrd8N1LB6YZUORfS2p1n+AD8PiYJLgxd3jNIjJcOjRco0G2xW1OSnGwcV
         Wx/3Sywl7pzt2v45LWflv73kkaL4yktH+RFcSfGHss4HqMTzVCCfrxPkjZDpmJQ6Z03X
         HpIAVSo8rUdC+yOeYkker83AOhSbMoyDPw1CkmxwePqNmLhehq7GImjJKcRtGVTI52oB
         0VZKCd6YS1PuynAC+2Au6FQffRpuZKug7DqXhj/yWnHAxL8wCzQcqpO56Kk6Lh5o2tIn
         m1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785385210; x=1785990010;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=azv2+HA7vkhRDpwslh4d7gUmm4xOpVdOQXO9Gfi01QQ=;
        b=mG0BB80qTzE0FdZMXRNQnaQsgz8we+e51RQYz8r4c6BRD8y10pTvxNGCXOfjX2NYWk
         hTAkRByLO87HO7iMnnnS1ObFZg74qzCmvcgbHS+4ab43RlSOqbi1RyIoEE/C0owwEskd
         PPKIWGkILba6+lFXENlUhI8VNoIiZe9P119r83oYtK98LZ39W/5HL4o9xEwz0Tjcy6Rr
         qvoUODlEXLK+oyy/wx1ztTUVfGihNYbf9TaqEKYE13S2j+5CXMFdFgaSNjFAp99NJHkW
         Cj29/zcj3BaPyh/6z61LtVek234myq8HvUKEeDTbz+lM1P7VS8VGAjoe/74HuSIRuSS9
         vYwQ==
X-Gm-Message-State: AOJu0YxwzNJGtdeNuR10mlRb2xjXMz4olFW8APMbKcHUguOyjNUExepS
	Ezt3aMhEMilwhEZjBh5X6alYl7Rmjb8+GoeCEasl8KXO3mc51sZigQ8tAQWytOksI58F3ojtBOH
	3F4+cOFAG5aLglX/m7i3Z6d25aZoZ1Rs=
X-Gm-Gg: AR+sD13ZMCenfoSpu+tDf/AMK/wdsT3lS+jIMQTei1hqj6kCICSvpJ/fj2xFQWmLmfY
	juU4snjmYAci47/MGWa/1aSPmOvXcjr4meT4GVrRTKIB0SiOuTe5iobi09OSEjCDs7lAEz5WJUM
	ts292vG99S2idix1Ft7bEQfzITxerr9vNiuJXMx1jRB+7HTLt/u/IQLkk6VijhwEjOyeIKA2a9k
	DmpLN0/FtsIEFEOZIWBfLHhGutyJMIhYEpG1BB1H0+ADtwN8efbywXlHDfabejtQfDi+PceKiuM
	y6Z0RdYACZthlo3jkdIGwjJEn1Osmpeijb9S+v8eVeCL
X-Received: by 2002:a17:90b:2e04:b0:38e:55ec:e436 with SMTP id
 98e67ed59e1d1-38f9bb23ecdmr1365956a91.0.1785385209772; Wed, 29 Jul 2026
 21:20:09 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 29 Jul 2026 21:20:09 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 29 Jul 2026 21:18:16 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?67mb64KY64qU7Zmp7IaM?= <safenine@gmail.com>
Date: Wed, 29 Jul 2026 21:20:09 -0700
X-Gm-Features: AUfX_my_2cSJP_W0LxyEvwFDN5YpJmJ7RkwiALrPM0irGvGVciJFCjmk9aUmTgg
Message-ID: <CAJ79ZrGy5F0LwQ=xZBmZi+MnTybiATPg2FGbS-7NaMWvb_6syQ@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for LG Gram 17ZD90R-EX79K
To: tiwai@suse.de
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"

From: Jabong Koo <safenine@gmail.com>

The internal speakers on the LG Gram 17ZD90R-EX79K remain silent,
while headphone output works normally.

The machine uses a Realtek ALC298 codec with PCI subsystem ID
1854:048b. Existing LG Gram subsystem IDs 1854:0488, 1854:0489 and
1854:048a use ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS, but 1854:048b is
missing from the quirk table.

Add the matching quirk for subsystem ID 1854:048b.

Tested successfully on Ubuntu HWE kernels 6.17.0-41-generic and
7.0.0-28-generic.

Signed-off-by: Jabong Koo <safenine@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7752,6 +7752,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1854, 0x0488, "LG gram 16 (16Z90R)",
ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x0489, "LG gram 16 (16Z90R-A)",
ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x048a, "LG gram 17 (17ZD90R)",
ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
+	SND_PCI_QUIRK(0x1854, 0x048b, "LG gram 17 (17ZD90R-EX79K)",
ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x05bf, "LG gram 17ZD90S",
ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x05c0, "LG gram 16Z90S",
ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
 	SND_PCI_QUIRK(0x1854, 0x05c1, "LG gram 14Z90S",
ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
-- 
2.43.0

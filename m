Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128194;
	b=jUJlZ8ZjOyI2H0GBZ+DwH5CqdgG7uJK2YpjzL8bwXMPs7DLDEh+ws0/IeBtIwwpBBYdx
	 OArZ2rhjAY+ymrhLBTt1YebCtEuAM6qmkUy82adpWkAXINd9X36wJM2cyxkYzmiYY14p+
	 DqZfE+i0QLtWv8g4Gwd/etOlpAkzsQ9XdmmC1w6Fr0RBc9UOzf7nlvYMq+rkTqUEnLhi8
	 +S3q2yrDIOHsHYXCIsmhSZIu7O3F4bIsLYV2aLKWqH00DNu5V5CJ/YU+Ey7fSttjmr/o+
	 5p+Pr61hPDcs9IkoUxTmnHIcOFCIh5opgGzS96u/m/EpHi3TJaXqQOuN9JOvEOUVOjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=y5Er5qEWvFzLAS9aWf5qOCZttioGJLL2l9OxkXkcHF4=;
	b=4UA20gh2Zo7Jf1zTS1eiCqXko7z8Sq3wJt2kI50mcxbbrui39wH/g9lxskIBkABRAKTw
	 /Zmw5lJ4FlGa45RbkHrvnLt7QLJIv4y7Dlnk6TxOaderzJALvMuRwJwDidCFZ72Avp2Mp
	 0kEFgoYbYLL4dM2qCHYkDyIB5w7obYhJ7nvvMdLhShvnRBQQO2WIXtVjZoNmW1jKtL4tb
	 S3IrZCjerHImRLpCxMXm4TVESjL240AagnJ+teFhRw2atVI9uV/n2ii8Tn4hzyvcwFMJi
	 0kWmeqs5Wn1XlADjnnJkAaHLIe1+d9cx4g/nrFF9dKjFfeQob69/qF5xjG3vcxEODtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFwc0Qxt;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C63D606A321
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 19:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C63D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFwc0Qxt
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c63449320so2609766d6.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793128192; x=1793732992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5Er5qEWvFzLAS9aWf5qOCZttioGJLL2l9OxkXkcHF4=;
        b=iFwc0QxtKG76JUMl2HWekEwDI33TNnCt2y9nWcJ65IwzjkK4LxT5CaY87gCvkOC+oK
         57r9O+M6Fp0ONj/vIOuk0J7sWgFogPwiD56E3H7vIYiAH2e4eqx1gXB6mnzcyIsWgg7a
         0OoUpyIvq36IsQ8WvDgU5vmy74firXzRHebDvmDH/N3V1ZHZQFqVRuHP6Gjc+Fam+Q4l
         i/uQtZpeUZmKbPS63QICi6k09ZyNp50r8QCz2i3ina8w3Mcu0khyN/AKTHsHnrmo6gb7
         rPV/dvhNzt+yuVTjNeIhQkVzWJ5FbBy49tJozbLHZJkEOvQE+GddV1Ved1+SjLPwEGOF
         vIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128192; x=1793732992;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5Er5qEWvFzLAS9aWf5qOCZttioGJLL2l9OxkXkcHF4=;
        b=PawVPgRslZuaKxZjtS8Z/OLbffiz4z4HXl2ARDHAQLvKe9lt72bdyVw+UqQX78Rqff
         YBZGRbZF4z6ZqEp5SCDWeAc+K3f2p6c8FJWgEjObiZd3U6cAF82oYSBjJxklf9e+szZg
         fFXQTZnXOCeQKnp4gBqCl+49Jn0neS3Qd4BsP+tgCSuPJYQ+R/ThQJQ4KVi+zJ0Cf2z5
         gyqJnUFYd4+T66RxFy/xtrKuResGjaJayn/9xgg7F6O+Yf+pO/qDS/PvE9kt47BvasaQ
         o22MBeMPms7RhxVwiwslrjyTfF8KlVsCXqe0dgJOyb6YlTzcvb3qu1WdgJWUvu+Lc9do
         ihjw==
X-Forwarded-Encrypted: i=1; AKwUvBzJPlW+KWgP1wXc0AXnPptVgPqqQYXX0DE4R7bTE2Www9UOouWVI6njPkSCwGakwftHEx6kmDTX7efDGA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIDDAtVa6yGcip40rPoa3MtSyowademu8T56Kbw5FdZrAgusDGY
	2MbnlJvrnXKAJbIm9xmZ6ZNvhcxLXjc/KrRM61e0764WCBd7DPbW1JW6
X-Gm-Gg: AYBFou2R4baIwe3aOIY/XDInDN0HWqryCR8cbZW4GFYyyXBmaad9IpA8iRsGZWj0P0T
	oN+iLfOU97VKpfzhKYsgMlCYW/ech60/vD9L9ME3VKGq84iXaOUGxSLF3f3PRJKeLHmxpKMo6Sj
	UkdugoPLjgt8Pi2HSaYcQWHgn18y0pd7dQeVvcluuBPlFOavS/pThiIqif+ZeB9OxjeDq4Ynlx9
	tw0rFQJJMlF/rm6ICMuYfWCIPWg8f9MVvQSOdik0hIkziTDgWg5bs+iGsiNUCnRh5nLL5HBs7TQ
	ngwMEeLUecDwMlmxVgaAvuM6CObLORUGd9C5XmvJ2M1MntPlUJVoG/ezqkuvj+GGyZbaIyosC8P
	lYzc7VCdUJhKGv01bmSHTO2tuYcoz+ZsAS6QaYIzvj+vPXB4qSX+4sWdZFydsNnRQ30VeaMy6To
	uv+5LdHXixcYhzkcmeo7rDwlvD7wLX0hCEn21KLjiNMaTR1fIU7nXkY7nJOVJHzPny10mfW8Vc+
	uiKkA0ASiFimXDbDpMrPxzJrBQ0akXQaGxVm5XWzOJyOqDBL0m7vb4Ex/QtQoBVnSid6jKXjqEt
	L1t/W1xGmRl4+tTX0l62yPhHZaFUHZlwtmKFaA==
X-Received: by 2002:a05:6214:29c2:b0:912:517b:8fc with SMTP id 6a1803df08f44-91c7d1dacfemr422896d6.46.1793128192011;
        Tue, 27 Oct 2026 12:09:52 -0700 (PDT)
Received: from [192.168.1.216] (static-acs-24-154-158-10.zoominternet.net. [24.154.158.10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a69129sm108541016d6.4.2026.10.27.12.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 12:09:51 -0700 (PDT)
Message-ID: <28bf49a0-63da-44a3-a9c6-c31a2e0f4e09@gmail.com>
Date: Tue, 27 Oct 2026 15:09:50 -0400
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66
 Raider 11UE
To: Takashi Iwai <tiwai@suse.de>
Cc: Andrew Udvare <audvare@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260909193104.26508-1-audvare@gmail.com>
 <2bcdce5d-aa6c-4789-ab50-68dad16127b1@gmail.com>
 <87fqxv8pif.wl-tiwai@suse.de>
 <1ca10bd0-0452-4411-8577-9753ea50f56c@gmail.com>
 <87o6cf382s.wl-tiwai@suse.de>
Content-Language: en-US
From: Benjamin Pryor <programmer2514@gmail.com>
In-Reply-To: <87o6cf382s.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Apologies; this one included the code from the original patch as well as the
line added for the extra device, whereas the first one only included the added
line. Below is the patch for just the added line to the latest source tree.

As mentioned, I'm still new to this. I personally use the affected device,
so I figured the easiest fix would be submitting a patch myself, but I am
still acclimating to the format. Would it be easier for me to submit a
new patch for the affected lines, or will this suffice?

Thanks,
Ben

---
  sound/hda/codecs/realtek/alc269.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23aa175faedd..1d3f60ea9adf 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8330,8 +8330,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
  	SND_PCI_QUIRK(0x144d, 0xc1cc, "Samsung Galaxy Book3 Ultra (NT960XFH)", ALC298_FIXUP_SAMSUNG_AMP_V2_4_AMPS),
  	SND_PCI_QUIRK(0x1458, 0x900e, "Gigabyte G5 KF5 (2023)", ALC2XX_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1458, 0xfa53, "Gigabyte BXBT-2807", ALC283_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE",
-		      ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x12fb, "MSI GE66 Raider 11UE", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
+	SND_PCI_QUIRK(0x1462, 0x1305, "MSI GE76 Raider 11UG", ALC298_FIXUP_MSI_GE66_ALC1316_AMP),
  	SND_PCI_QUIRK(0x1462, 0xb120, "MSI Cubi MS-B120", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x1462, 0xb171, "Cubi N 8GL (MS-B171)", ALC283_FIXUP_HEADSET_MIC),
  	SND_PCI_QUIRK(0x152d, 0x1082, "Quanta NL3", ALC269_FIXUP_LIFEBOOK),
-- 
2.43.0


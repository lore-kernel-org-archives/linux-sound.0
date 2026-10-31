Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793439943;
	b=A0tC9LXrnLbfCuW7X2+Q3wPoJEe+eol7oPOckLPi0NKk2X+AxzICZBuDumTLcZ+qgsdS
	 5Y2lzH8DfupLKxwsEDbwOADdx9cOWq+8sIkgvlrq9G4BJlQB4yoSUipe+hCm5KYwggF36
	 75Bct0jhRc3SA9ju5FiU4CsM2oogfRe82R/RaJG54GhmO/EjmESwTD8e1A+932jF5f+NJ
	 HD6OH0zKfs2ttOZYkeDreJBii13JNRlRtq+legFjOrKo5Wz15MYeHVChjWD2sH56BNgEv
	 aGYdRqBnMDfyKTeljfmt3Md+YoivKkDov5Qr9pNm/LdFJV88BH5p3sObrAYMWSD5xcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793439943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=aHVvtPc+aACLACpBiqx0CAo4pA5lJCGtN1YFsuq1JL8=;
	b=t4xOWeAPVay46/HSIrBZBX2Pa2iEtUo+7LEZmnjUK3hctkWlNDZE7I++GkHRengRUqIb
	 C6GWi/mWlyiCt7rpV9oNEJDsIzDlr37Xtt7xW1eUMiz475aT8TjOHmK1loxL6Nb71b6oM
	 pCiwf8szmN7TmYNy9Re3I03tmJHLRwMLv+cP+2UYJMzRGnhC4wvKa6ET4IzR+djJMdpjn
	 HnW0bt+jDCwnLWfzQUAPXTgtGvRVM1ZJIJhVuVFgXe1h/ZWPwI9TwCLIPothJkMus6Yyr
	 w8Do7qcSfLfFR0OLLLrg+8+z9aDMzquJ6D7N/GU6DLELwFqNUuG6FvnA27Vjlyu604Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZ6gco96;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCBA606A31E
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 09:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDCBA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mZ6gco96
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ac4806e210so12364047b3.1
        for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 02:45:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793439942; cv=none;
        d=google.com; s=arc-20260327;
        b=JkNE4GW1vtSbew65YoMa/v+jf6/JRqN19rxon4QBLGQ+Il5Uqhkmr9cYYfQhxMifml
         kof8YPKSWrBV7TUWBoJgJZY1YBDRdTP2WEzUbZTc86ffVhPkWjzEaBHTJrvEDVUXWbyG
         ktV/XL1/7xjpj42/cG8GfMIGNP9tleH6ZKeXwcOqKfjfEFEbaTndRwMCZ3oBR3skyxHb
         1pYR08TagkaNJEzmhyyHtLVSBmEAhMWL7a+y22geAMqBXhfcogKd1NfrX6ZbrlKw5yl1
         dibMgHLgBqULCkzD2ENwe9102ieoEIgqEnmlZIAv1e+xn7qxLbqcjQYFHUb2BxV74jb7
         nIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aHVvtPc+aACLACpBiqx0CAo4pA5lJCGtN1YFsuq1JL8=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=F5xIDo6h0qyyam8TRH5bzLj7Cnp0Z2R8hqMfyF2i4lQyjhPODFYjl/9UEwCHgGeVMv
         pMoLmMhamdTRVD4bSq7MF4yaTV+JcuICT1C5mXJ0Wu1oQUXPj5hrAYIgrJG72oNkxMet
         O5uYDz+EnZgnTIGXw86Pl0hNzxzXnL8DCbHcVaXqhqK1gvOzEIvWAS8nmupnTZOmnXcZ
         NzaknZvAq0G/135g+2iWi67MJCGfmjZe5aXngLVtCnoHPk1CeewV+gaSelSK0436qFg6
         UJxc3ktLw6F6RMGvC/sqmI7THQzPTJxa8EnVFT7ePHnMgCHHuXqFYyOS60iU4LA3CF7l
         D23A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793439942; x=1794044742; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aHVvtPc+aACLACpBiqx0CAo4pA5lJCGtN1YFsuq1JL8=;
        b=mZ6gco963c4nGXS8YBASV0WgO2YJUaxaksZdo/SLT5kJk7V2wsSLFiXZMvStuhpHZn
         WvquztUJVQkbBb+tPNo6fukTpb0OHq/Ap1cZCzPbu7jT92D1QpyX9kdEWzG6owlmJ9EE
         eaXAZ5VtuHOQKPDBmqwApHvsrUxnraFwxJYptEdNMhjMdM4ODWdgVQUQGHErGhuq/MKg
         BPJuqkqdt73Lsz7GBxmKcObhnqof3XTjY0uvJTh6ZB7y3OP6o1BcN4/QTcu0xmsQTOa0
         9/VjB0hTrHE3PiMEAO7LlfWrDz0XiVtqCb2vb/T7/zCbFgZaw3NPOJG7OIQOmzkSnakA
         QJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793439942; x=1794044742;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHVvtPc+aACLACpBiqx0CAo4pA5lJCGtN1YFsuq1JL8=;
        b=NtTR2bpG11vMg6y+uJp9/XhmovwAcTMZy1xqhujO9OdNZgTN2hXo7ac3jT0kzx9Syc
         5dtI8t5ziytLJY/FHWWeJLQ5e+CYzdoWfSVTykFrz8IFjXwqOOdBN+XVmIWrJaRWYq6S
         Pt7rDiWWa8uvdTISP1l4t5DfBsJ+YR+ptG9PA8PKEwGUW48Rq/smMv9YZ9OHeeSbEEwR
         tMnfg8A/zWAbrYmTH/25L7YbOmRpr7Cc/v0LSGvJiRbjuA1jYlToQncyOPhBXu8SCBti
         dqwT7SxkvtXOG53a1YHJVSbO8mRVN+3x2IXt2lDlwsQl6zH4KR0xYsaq+ul2UqgDJXsN
         dkYA==
X-Gm-Message-State: AFq9FYIUSAozwrBVTMUrXi02IkOfEeWjjNx2mHjYlLdCXVYg+HD+p2Ig
	Ae1ZB+q8NUztKosLcbJBN86AQgJLCYKYkliQTvgWgKAufn8FARhZrF3tlhf0pyEFgNXA+BgbTBA
	B9AXK6U310GBax/0hjKOoaF4bGY9T8Vn7TL0LQz0=
X-Gm-Gg: AYBFou1Ma6tQyzUdMRaqUg3Fv7soVqe4vsml6AnmwVwhKGTA0D3sE2iBHoNH/YNldLP
	GY6UF6eCFMCnM1ajWKDy5Ui5p1HCLFOHkOTfcbsS0Xm/HO+1Pa7pVT7UxiyuspfAIhqCANnuL63
	u8PB6pXRC1gGw++Lm/aDQ6nypus5pAQdracjJiavOkG1Zy5s5me97+f/1DOgsGe44sZe+uk6hHG
	4uQpqFUWuIIR9Orf+VZzFvZRIqxMgbcJMUDWHQTXw0uoTZrLXUwxu3ZyrPBCJ7yHY/ZC6q36Etf
	X02zqLiT4RmIIlQZaWRlj+J1QVlG8RUe8MvWTRuv2Ht2Zfw+4mBMPjowOzp9ZJEC/6nXzLNz/+Q
	YMdx7Jjiec0yUJ+TlXpYL6j37ZgBmBScRgIFWg3J98r3BwEd5E0XhnZRG2SfqIG1NOy1zacPZ4M
	nMQRCyopnobNM51A==
X-Received: by 2002:a05:690c:d83:b0:8b0:8a9c:fac9 with SMTP id
 00721157ae682-8b2b6752e0bmr33519037b3.28.1793439941857; Sat, 31 Oct 2026
 02:45:41 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "&anup" <adhikarisanup1@gmail.com>
Date: Sat, 31 Oct 2026 15:30:30 +0545
X-Gm-Features: AclHuK9rmY3v-4oXWQMM35msscDPQ-VtETVhIN9SdrRPjdIFFvGNqVba9FH8fVc
Message-ID: <CALyFdi9t=QeLYqRJ9d=NoUJk0FyFAdMuC_U9OKzR=huxUxgBMQ@mail.gmail.com>
Subject: Lenovo IdeaPad Slim 5 13ARP10 (83J2): speakers silent, Conexant
 SN6140, SSID 17aa:3810
To: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The internal speakers are silent on Linux but work in Windows 11 on a
Lenovo IdeaPad Slim 5 13ARP10 (83J2).

Codec: Conexant SN6140, subsystem ID 17aa:3810
Kernel: 7.2.11-arch1-1 (Arch Linux, GNOME, PipeWire)

- aplay -l shows "SN6140 Analog" as card 1
- dmesg shows no errors; the kernel uses a generic fixup
  ("picked fixup for PCI SSID 17aa:0000")
- During speaker-test the converters show stream=5; speaker pin 0x17 has
  EAPD on; speaker DAC 0x11 is unmuted at maximum;
  Headphone Jack is off
- Toggling codec GPIO 0 to 4 with hda-verb had no effect
- No smart-amp ACPI IDs found (checked TIAS/TXNW/CSC3/AWDZ)

alsa-info output: https://dpaste.org/3CLYn
Codec dump (/proc/asound/card1/codec#0): https://dpaste.org/KDbdZ

Could a quirk be added for this model? I can test patches.

Thanks,
Sanup

Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686F3EDAD0
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387715; cv=none; b=gR20k9HIHhdA5iaxnj0WqI6xw5D7lFTxkwoBu87KDFs0ILTGuf292g5hBUKHaop+/X0K8TQWARNo7jwbjHGuXTsym0HJKXIgI2xMjyA+Mij2XZ3WllieLT7oWKNrGgoS45kweuvobeoxcof9FYdwrUKKemfnX7p6yu7+qpzCmC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387715; c=relaxed/simple;
	bh=PJkzv9PhbmYUkZ+2umV4Qst1Iq16XfXenBbC5o5H3P4=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:References:
	 To:In-Reply-To; b=jdBhb13sScnnV4F6aZVqrh3jk2GXf0wIbIVGZDNEWq19UmH0o+T6UF/GJNuClsLp0W7m/5mtllUP27Ifi9iRce1rfo6n4nWcZuqSXoUp5DC6tNK6FnhlPZ6C11aiSizf9aNqnRYHbxxVV1cdwz8uXZoLo6iAYgA27S/sr2/+Y5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X1a8oD7v; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X1a8oD7v"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b884a84e655so321628766b.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Feb 2026 06:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770387713; x=1770992513; darn=vger.kernel.org;
        h=in-reply-to:to:content-language:references:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ONfDtIffMeMrRZPQhPEH8v2YplXFgA/Uq0WXoqqDP+I=;
        b=X1a8oD7v1kWuxHuXtodDKtxJYLG5RMaw+YP45CxqVix9MQZ+svxxebziuXQmSDweao
         VDu+VVDeWPzLM5IXvNXNvh2skt4TA80fQfLUYDec4jlJ8vYS/ZHBMm0gQ0ZKfQtfWZr5
         9MchR9Z2fCMNLO9lQA0GF8SmswmRtXteh4dgMkLAI0x2yLhLTWuxpstVHhyinVbWSZc8
         b6S98wijaTizQRlhZVZelUqbkx3SGJXyAuMt7ku1jqir8A2dJFDmlMD3pBreTxOq0Z7O
         uBcj7K9toBWW97+53sYV7x6nN0HCiBNZaGgeWs2+0NCsoI9KnaWDfyEFH1TUckncg9YY
         H2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770387713; x=1770992513;
        h=in-reply-to:to:content-language:references:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONfDtIffMeMrRZPQhPEH8v2YplXFgA/Uq0WXoqqDP+I=;
        b=OP9SMA92pZsO11m+dFub0BO8W8cQbggV9XY3hZuR7fd9DRg8XphwNCm31nvutx83HF
         daOOaS3S7/NiQHxMZ6Ha68zPn/YTqieEk5tu3qNYc14u5jkY00jml11A4WP56G79n9AW
         scQ913Qn7EMx3Vkva6s698+m10EebiB3FSe+QVKM/qPl92yso/TXJelas5UKJ+4XoanN
         0iLqP41jmuHEzydFc1LELqS6lKkjB+WNJQW91bFQ+fXpkUhM92S/WB0/cTOl7Zna+j6b
         zolNhiqs3Xo9Zcw2We54yuZZ5u2nfjXNdboddW8uqHa/3f6WVxlNKA33dITexnvIdKUn
         ARVw==
X-Forwarded-Encrypted: i=1; AJvYcCWlHDE6b6biB79KQzMwGH/jWqqkthCKbVFKKLBV0oXcNGcNY11hiMt4aI9fJzlAs/6+LjOZaKyQE6Zbdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLd+b5mNWuiIgBSpvICx0xm0g5ciR9KnlgAyNCiStb7sQ+GPR
	/WW7X4rBd/NUuZxkMa6A45rsrOPZQ6YCMaNjEOohmSFeP7qhvuD+jmD8
X-Gm-Gg: AZuq6aI6/tpoy0rTN4owcI+XC2K/FlQMRLdjRGeyEU8M/wZiY8XLcQ+u4LyRk+Xs7i+
	SZLsuGZqW7deK7ZgWTeO1s0PM9mpeh4eLp7IEFrfIEA2A23Yhz3K1omArh1RktKBVZ/PrwII8R+
	cAHYcRJ1wvOviREBNjYj/9yylxxaqrBCOOJJMapRJm8T76hx3ct8YyLo6PUtzFEAgRKO+pXZfhO
	n7fyZDo5o57Ezb21udJpeIRwyaQtvtwgbIaiPn+mISC6aGOHgJtkd3CDqOOSN2SFM5xNUI6QE2y
	CA8hpmfqdIE6XGWkzW0Tly/Ilzl3Dtz6dmSIiuT8LFA1N4lfmNOuh6hoXeRR5oJo9YuT0MH5RuK
	xUTIxffqy0bY9KNwafMTAAP6K9FrYEPt7xrAdgRloW0bv5rIpKfIDApjt0hhl8wQ462EuUPbGBy
	WuyDdg9BDcmh42vPX4wT6bTQeRpYETOifHU9cypRWRAxoepaNvBQa9KyE/TA/fmQdlq23TYf7e2
	vp+kyvtPmD01N4PSodapRF/RmzQ88Zn
X-Received: by 2002:a17:907:96a3:b0:b7a:1bde:1222 with SMTP id a640c23a62f3a-b8edf47adbcmr169766966b.63.1770387713121;
        Fri, 06 Feb 2026 06:21:53 -0800 (PST)
Received: from ?IPV6:2a02:a442:44b4:0:bbe2:4e0:433:9385? (2a02-a442-44b4-0-bbe2-4e0-433-9385.fixed6.kpn.net. [2a02:a442:44b4:0:bbe2:4e0:433:9385])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a52bsm87329466b.14.2026.02.06.06.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 06:21:52 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------DTK0JNSi8g9fm1jaUu5QPZz1"
Message-ID: <64d78753-b9ff-4c64-8920-64d8d31cd20c@gmail.com>
Date: Fri, 6 Feb 2026 15:21:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: anton <antonvg7@gmail.com>
Subject: Could you help me upstream a quirk for HP ZBook Studio G4 mute LED?
References: <3ccd4c55-9b8d-47d2-bac9-8c1e9290c410@gmail.com>
Content-Language: en-US, nl
To: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
In-Reply-To: <3ccd4c55-9b8d-47d2-bac9-8c1e9290c410@gmail.com>

This is a multi-part message in MIME format.
--------------DTK0JNSi8g9fm1jaUu5QPZz1
Content-Type: multipart/alternative;
 boundary="------------n1m1k3MA90sZkrRNDStHJBXD"

--------------n1m1k3MA90sZkrRNDStHJBXD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear kernel sound maintainers,

Could you help me with upstreaming the following Linux kernel patch to 
add a quirk for the HP ZBook Studio G4 mute LED?
I don’t know how to start, but I saw similar patches get upstreamed before.

An associated bug report was made to the kernel bugzilla at 
https://bugzilla.kernel.org/show_bug.cgi?id=221002.

After some research on forums and wiki’s I found that adding a file at 
/etc/modprobe.d/alsa-base.conf with the contents ‘options snd-hda-intel 
model=mute-led-gpio’ makes the mute LED work as expected for this 
laptop. To my understanding, the patch below should configure the 
corresponding quirk. I have tested the patch on the HP ZBook Studio G4 
laptop in fedora, which made the mute led work without the file 
mentioned above.

Thank you for reading this far. Please let me know if you can help, or 
what the next step would be.

Best regards,
Anton

(the patch is also added as an attachment, in case the email messed with 
the formatting.)
---

Allows the LED on the dedicated mute button on the HP Zbook Studio G4 
laptop to change colour correctly.

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c69..d6fba7460301 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1081,6 +1081,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
      SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", 
CXT_FIXUP_HP_SPECTRE),
      SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", 
CXT_FIXUP_MUTE_LED_GPIO),
      SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4", 
CXT_FIXUP_MUTE_LED_GPIO),
+    SND_PCI_QUIRK(0x103c, 0x826b, "HP ZBook Studio G4", 
CXT_FIXUP_MUTE_LED_GPIO),
      SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", 
CXT_FIXUP_HP_DOCK),
      SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", 
CXT_FIXUP_HP_MIC_NO_PRESENCE),
      SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", 
CXT_FIXUP_HP_MIC_NO_PRESENCE),

--------------n1m1k3MA90sZkrRNDStHJBXD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html data-lt-installed="true">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body style="padding-bottom: 1px;">
    <div class="moz-forward-container">
      <p>Dear kernel sound maintainers,<br>
        <br>
        Could you help me with upstreaming the following Linux kernel
        patch to add a quirk for the HP ZBook Studio G4 mute LED?<br>
        I don’t know how to start, but I saw similar patches get
        upstreamed before.<br>
      </p>
      <p>An associated bug report was made to the kernel bugzilla at
        <a class="moz-txt-link-freetext" href="https://bugzilla.kernel.org/show_bug.cgi?id=221002">https://bugzilla.kernel.org/show_bug.cgi?id=221002</a>.</p>
      <p>After some research on forums and wiki’s I found that adding a
        file at /etc/modprobe.d/alsa-base.conf with the contents
        ‘options snd-hda-intel model=mute-led-gpio’ makes the mute LED
        work as expected for this laptop. To my understanding, the patch
        below should configure the corresponding quirk. I have tested
        the patch on the HP ZBook Studio G4 laptop in fedora, which made
        the mute led work without the file mentioned above.<br>
      </p>
      <p>Thank you for reading this far. Please let me know if you can
        help, or what the next step would be.<br>
        <br>
        Best regards,<br>
        Anton<br>
        <br>
        (the patch is also added as an attachment, in case the email
        messed with the formatting.)<br>
        ---<br>
        <br>
        Allows the LED on the dedicated mute button on the HP Zbook
        Studio G4 laptop to change colour correctly.<br>
        <br>
        diff --git a/sound/hda/codecs/conexant.c
        b/sound/hda/codecs/conexant.c<br>
        index 5fcbc1312c69..d6fba7460301 100644<br>
        --- a/sound/hda/codecs/conexant.c<br>
        +++ b/sound/hda/codecs/conexant.c<br>
        @@ -1081,6 +1081,7 @@ static const struct hda_quirk
        cxt5066_fixups[] = {<br>
             SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360",
        CXT_FIXUP_HP_SPECTRE),<br>
             SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4",
        CXT_FIXUP_MUTE_LED_GPIO),<br>
             SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4",
        CXT_FIXUP_MUTE_LED_GPIO),<br>
        +    SND_PCI_QUIRK(0x103c, 0x826b, "HP ZBook Studio G4",
        CXT_FIXUP_MUTE_LED_GPIO),<br>
             SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4",
        CXT_FIXUP_HP_DOCK),<br>
             SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF",
        CXT_FIXUP_HP_MIC_NO_PRESENCE),<br>
             SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM",
        CXT_FIXUP_HP_MIC_NO_PRESENCE),<br>
        <br>
      </p>
      <lt-container></lt-container> </div>
  </body>
</html>

--------------n1m1k3MA90sZkrRNDStHJBXD--
--------------DTK0JNSi8g9fm1jaUu5QPZz1
Content-Type: text/x-patch; charset=UTF-8; name="HPZBookStudioG4muteLED.patch"
Content-Disposition: attachment; filename="HPZBookStudioG4muteLED.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9jb2RlY3MvY29uZXhhbnQuYyBiL3NvdW5kL2hkYS9j
b2RlY3MvY29uZXhhbnQuYwppbmRleCA1ZmNiYzEzMTJjNjkuLmQ2ZmJhNzQ2MDMwMSAxMDA2
NDQKLS0tIGEvc291bmQvaGRhL2NvZGVjcy9jb25leGFudC5jCisrKyBiL3NvdW5kL2hkYS9j
b2RlY3MvY29uZXhhbnQuYwpAQCAtMTA4MSw2ICsxMDgxLDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBoZGFfcXVpcmsgY3h0NTA2Nl9maXh1cHNbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4
MTAzYywgMHg4MTc0LCAiSFAgU3BlY3RyZSB4MzYwIiwgQ1hUX0ZJWFVQX0hQX1NQRUNUUkUp
LAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDgyMmUsICJIUCBQcm9Cb29rIDQ0MCBHNCIs
IENYVF9GSVhVUF9NVVRFX0xFRF9HUElPKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4
MjMxLCAiSFAgUHJvQm9vayA0NTAgRzQiLCBDWFRfRklYVVBfTVVURV9MRURfR1BJTyksCisJ
U05EX1BDSV9RVUlSSygweDEwM2MsIDB4ODI2YiwgIkhQIFpCb29rIFN0dWRpbyBHNCIsIENY
VF9GSVhVUF9NVVRFX0xFRF9HUElPKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4Mjhj
LCAiSFAgRWxpdGVCb29rIDg0MCBHNCIsIENYVF9GSVhVUF9IUF9ET0NLKSwKIAlTTkRfUENJ
X1FVSVJLKDB4MTAzYywgMHg4Mjk5LCAiSFAgODAwIEczIFNGRiIsIENYVF9GSVhVUF9IUF9N
SUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDgyOWEsICJIUCA4
MDAgRzMgRE0iLCBDWFRfRklYVVBfSFBfTUlDX05PX1BSRVNFTkNFKSwK

--------------DTK0JNSi8g9fm1jaUu5QPZz1--

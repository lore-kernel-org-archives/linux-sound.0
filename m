Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E36313AA51
	for <linux-sound@vger.kernel.org>; Tue, 30 Jan 2024 17:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706636081; cv=none; b=PpF+FU9BKuILoAVTskLU3w8d2mmK8uZ4KeelIFQ88C05IwCvUnFG1hqIAPe54cU4mEfauM+ajYmyEW5tElgsCtN0slkrTVWA+alWraNMP9+S7saaS8sEAUPzoFGcbpO2rvIU7PUxmXo7UOg4hOAx4xT7ePQyavoaaU36P93YLV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706636081; c=relaxed/simple;
	bh=52YJy+IoDwzbo+06rGlvdRT+hBjNIG1j5yLcPH7GCJI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=AuP8maLhkx9raJDzCyC3IF9BTnxwRqnbOrQA6sqB0uTcldYCPpw6t4j7zaR79M6IkRfdacMx0LzzHuMeDBA3SiLRFLy/ugrlB7q650RX7aNpk49cInCepl2jTgE4AbGbxtOXKH/c95UC7q+SGmO5ASvzcz9GFwquyk3FOeASK8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqlz6CKb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqlz6CKb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ae6f4fd78so2004834f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 30 Jan 2024 09:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706636078; x=1707240878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/E1n78DYsp/UPREpDI7DJX8KVo2LfqjNgm22hUYvahQ=;
        b=aqlz6CKb0kRkVpbCllKGSppq+PmTfcy9kkf8KpQRA7TQvrQLjEXraUdxdPUr3oPZBo
         mDQ3vvulq3+Msc/2OCXpKp6PZHR+McXsXHMEsPJvavNPr1NvmebhPRXkiD4iYdJsmtUg
         IXNAypiWUUEVMhTRiQp/AnHovi/sMKlkMRmL7jxmOI+yCJl7kqcCC5xtIlBUxf/mO4TK
         MTTdJgP9PdH4TDDI5GecmT2XQYjWOCNSf1WHmU7JFDnRPvuxyNTKn5E5TH6acwElEMra
         LE2/enkJ7iTYdxWXbj7ZH4EVR/Cb7Q5WF5iRbFHnM6oPB2djJN2nJrlC0KaYsOEspwGx
         HYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706636078; x=1707240878;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/E1n78DYsp/UPREpDI7DJX8KVo2LfqjNgm22hUYvahQ=;
        b=CPiks8fW1pkRW+1EJvMu3oT8Sfn31uYTj6hJNxwOiwcnFhhpy40b1UYvWm1Qhkkc3J
         MDZeR2aKZbiVAVdPXhuO6fS0HQUpxeZYHRlJ3XilMzl6uAKrmSGaFhTv35UiAsA1FCWj
         qz8GlXhRh1w1wjXOoag63QBEwNAK3CeaQguDcFj6Vt9XXLEdx29RBbFGuWFq3BLn01er
         T6kdhpl3Ke+2K3Hlg+Zi6HKumIEn+ROzIBJMlEKxWKxT2qzeIG0SZqdxpL1df50Tm09j
         sNmxQVHa3uq2gQD65y/ElT1aV3H7oWzCZLPm4GVeEHWDxXjRYwoFbN65Urmi2VxexuL7
         nm2A==
X-Gm-Message-State: AOJu0YznX1E5pUr2iB7ZNGfictW0PJHC9LNI7FRdxjoMbxqTk24HoWBF
	+29J6Bh6w3iLdmbGEES01P/z2eW4UVD6yxhGjw8uueqbkJ++DVAyp1fZTM9w44Q=
X-Google-Smtp-Source: AGHT+IHjzuD9BctTAAj/W2kCM5cj8zAZ+AJaFP+r4+U9z3fghHu66TlxY9H06Cj12PMoh29jX1RBig==
X-Received: by 2002:adf:ea4b:0:b0:33a:f024:271f with SMTP id j11-20020adfea4b000000b0033af024271fmr4191596wrn.68.1706636077501;
        Tue, 30 Jan 2024 09:34:37 -0800 (PST)
Received: from [192.168.161.135] (a85-138-63-33.cpe.netcabo.pt. [85.138.63.33])
        by smtp.gmail.com with ESMTPSA id f9-20020a056000036900b00339307d9d31sm11234912wrf.112.2024.01.30.09.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 09:34:37 -0800 (PST)
Message-ID: <e97f944a-7d3e-4411-b79c-fbf4805c7306@gmail.com>
Date: Tue, 30 Jan 2024 17:34:34 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Jos=C3=A9_Relvas?= <josemonsantorelvas@gmail.com>
Subject: [PATCH] Apply headset jack fixup for alc287 thinkpads
To: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thinkpads have a fixup for alc285 which enables headset media buttons, 
but not for alc287. This patch removes the chain to the X1 gen 7 fixup 
in the alc285 headset fixup, making it applicable for models without 
bass speakers. It then chains said headset fixup with every alc287 
thinkpad fixup, making headset media buttons work for these laptops. 
Signed-off-by: José Relvas --- sound/pci/hda/patch_realtek.c | 12 
+++++++----- 1 file changed, 7 insertions(+), 5 deletions(-) diff --git 
a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c index 
c80e2f3acfcc..21d10c62964c 100644 --- a/sound/pci/hda/patch_realtek.c 
+++ b/sound/pci/hda/patch_realtek.c @@ -8796,13 +8796,13 @@ static const 
struct hda_fixup alc269_fixups[] = { .type = HDA_FIXUP_FUNC, .v.func = 
alc285_fixup_thinkpad_x1_gen7, .chained = true, - .chain_id = 
ALC269_FIXUP_THINKPAD_ACPI + .chain_id = 
ALC285_FIXUP_THINKPAD_HEADSET_JACK }, 
[ALC285_FIXUP_THINKPAD_HEADSET_JACK] = { .type = HDA_FIXUP_FUNC, .v.func 
= alc_fixup_headset_jack, .chained = true, - .chain_id = 
ALC285_FIXUP_THINKPAD_X1_GEN7 + .chain_id = ALC269_FIXUP_THINKPAD_ACPI 
}, [ALC294_FIXUP_ASUS_HPE] = { .type = HDA_FIXUP_VERBS, @@ -9576,7 
+9577,7 @@ static const struct hda_fixup alc269_fixups[] = { .type = 
HDA_FIXUP_FUNC, .v.func = cs36l41_fixup_i2c_two, .chained = true, - 
.chain_id = ALC270_FIXUP_THINKPAD_ACPI, + .chain_id = 
ALC286_FIXUP_THINKPAD_HEADSET_JACK, }, [ALC288_FIXUP_TAS2781_I2C] = { 
.type = HDA_FIXUP_FUNC, @@ -9603,6 +9604,8 @@ static const struct 
hda_fixup alc269_fixups[] = { [ALC288_FIXUP_THINKPAD_I2S_SPK] = { .type 
= HDA_FIXUP_FUNC, .v.func = alc288_fixup_bind_dacs, + .chained = true, + 
.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK }, 
[ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD] = { .type = 
HDA_FIXUP_FUNC, @@ -10206,8 +10208,8 @@ static const struct 
snd_pci_quirk alc269_fixup_tbl[] = { SND_PCI_QUIRK(0x17aa, 0x224c, 
"Thinkpad", ALC298_FIXUP_TPT470_DOCK), SND_PCI_QUIRK(0x17aa, 0x224d, 
"Thinkpad", ALC298_FIXUP_TPT470_DOCK), SND_PCI_QUIRK(0x17aa, 0x225d, 
"Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST), - 
SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", 
ALC285_FIXUP_THINKPAD_HEADSET_JACK), - SND_PCI_QUIRK(0x17aa, 0x22be, 
"Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK), + 
SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", 
ALC285_FIXUP_THINKPAD_X1_GEN7), + SND_PCI_QUIRK(0x17aa, 0x22be, 
"Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_X1_GEN7), 
SND_PCI_QUIRK(0x17aa, 0x22c1, "Thinkpad P1 Gen 3", 
ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK), SND_PCI_QUIRK(0x17aa, 
0x22c2, "Thinkpad X1 Extreme Gen 3", 
ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK), SND_PCI_QUIRK(0x17aa, 
0x22f1, "Thinkpad", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD), -- 
2.43.0

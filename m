Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuP7DfRy"
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34F7C1
	for <linux-sound@vger.kernel.org>; Sun, 10 Dec 2023 12:09:44 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ca1e6a94a4so48365641fa.0
        for <linux-sound@vger.kernel.org>; Sun, 10 Dec 2023 12:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702238983; x=1702843783; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSa+OqxUO/i4/Sza01gEmArZUL60iMCDG4AxA6ExgVs=;
        b=LuP7DfRy9bTYAeHpIQY6LYhGjQk1gDOEV84uLyZsORG9LJbVFONX0In1Iz9cwb4IMH
         THxaH5bk7vNp6qrjpYot0VO7LV28zT1qkCoDjiq5w2ckJDrUIs+ra71Jlyxe6NutNdAU
         3UJ1NeqLgcvYKxjPio2C4F9106GOyYy8+owg2TfOX29P/5awYzbduenYlHJGBwtw6Dpd
         kWvF0E3iJ1tWaPq9q3wKzBaTwKXZ9I4quuyndWXPMN7WIgfUNxCPNmBC4pQ3MuDHuQC9
         7EvZllfMUcgla8PyxcB+sSWRELeLWITHy/lxeVqVjh2bpmfVHACGP5dsK14YuNrFDnuQ
         i1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702238983; x=1702843783;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSa+OqxUO/i4/Sza01gEmArZUL60iMCDG4AxA6ExgVs=;
        b=QSzQpvc98A6rHqmk/jNIhF4PPVXyc7Qnf5++htwTnq5uBvgE1DqsGYX815RcfdqfsS
         IWe59x+u1lFMtKCbhX1MNiuceP74QMfsjbz19dsAVdCDOZzkZ1/4T3QQGORsNTnOHwgI
         mDaqz1aYqQN5SvxS6kQlDX6X3pkh7v3LB9wOdgC7IY0bQE8bvJzOkdpYJX5HRIZkFaPO
         pVK56cs8jkYcGco83fLf3H0jCf4IJYdMMEu+ruANCWKUm+MwXdd3TvVqi5QgpdMqAcCZ
         e4ZN7J3QGEcLLj3zlV6TZ1qQDg6iJ1QJXyECg3GKNACqUR4fXNOV7YTfjdKV6FPoeBQe
         iFxw==
X-Gm-Message-State: AOJu0YzLGv49YZg6xl5FrHaivZUs9CVUuvtgMFuE096oMfLo2mEoRWJi
	vht6wOR207n3cgoN6jJkdoJltOiD30AKBJWQ
X-Google-Smtp-Source: AGHT+IG2DlE7wmyNlWrPsuUGMViYXJR23FktJM+jkh9eqV+illP10xRKkRKqeidhouM36Seahpjtdw==
X-Received: by 2002:a05:651c:1a25:b0:2cc:2028:53a7 with SMTP id by37-20020a05651c1a2500b002cc202853a7mr328606ljb.106.1702238982918;
        Sun, 10 Dec 2023 12:09:42 -0800 (PST)
Received: from [192.168.32.6] (host-78-79-232-178.mobileonline.telia.com. [78.79.232.178])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e8007000000b002c9f7c2635fsm995408ljg.1.2023.12.10.12.09.42
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 12:09:42 -0800 (PST)
Message-ID: <197f517e-6091-4044-8d60-e399ec981e8a@gmail.com>
Date: Sun, 10 Dec 2023 21:09:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-sound@vger.kernel.org
From: =?UTF-8?Q?Cl=C3=A9ment_Villeret?= <clement.villeret@gmail.com>
Subject: [Linux-Kernel][PATCH] Add quirk ASUS GV302XA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


---
  sound/pci/hda/patch_realtek.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9ddacfd920e..acbb88d777a2 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9954,6 +9954,7 @@ static const struct snd_pci_quirk 
alc269_fixup_tbl[] = {
      SND_PCI_QUIRK(0x1043, 0x1517, "Asus Zenbook UX31A", 
ALC269VB_FIXUP_ASUS_ZENBOOK_UX31A),
      SND_PCI_QUIRK(0x1043, 0x1573, "ASUS GZ301V", 
ALC285_FIXUP_ASUS_HEADSET_MIC),
      SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", 
ALC294_FIXUP_ASUS_DUAL_SPK),
+    SND_PCI_QUIRK(0x1043, 0x1533, "ASUS GV302XA", 
ALC287_FIXUP_CS35L41_I2C_2),
      SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZV", 
ALC285_FIXUP_ASUS_HEADSET_MIC),
      SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", 
ALC287_FIXUP_CS35L41_I2C_2),
      SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
-- 
2.43.0




Hi, it's my very first time trying to contribute to linux kernel. I hope 
the diff format is ok.

my fork : https://github.com/nectogale/linux-quirk-ASUS-GV302XA/tree/master

Have a nice day.


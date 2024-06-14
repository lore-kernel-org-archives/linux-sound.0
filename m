Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC45E19D8A2
	for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 20:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718398234; cv=none; b=JaCJ7svqr56E5zAM5ONBVOpGhawMMVmiqd0Dty51oBtFR7lU6v0SfH3LgcUfZE74og7yhacFB4LdhS+CcUeToITlRuc7EK2mOPn/jb0V7VO5lwUNWu16M7uESkbiL4k8qwJPXwJq3SMH/WdOKMiSzLHOrFMvYAHQCQF2Ic7Sd7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718398234; c=relaxed/simple;
	bh=4mHkXC7tayAdGFZwKDm8tNtJdBx2HxLJ94hMgIeTss4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Dx/LpBd/pidMJN2YHJwcggG40SO/kbAkQl4wWr+/AW0gKXNVEbA9nCwoln/RM7n39OKfyFLt8U+WX+oaRLcLhtqi6TGhtUhC5yObowPM/MYa/kIAccZl3JW5vzPw65YrQUsYoB10YoITh1miIRr6L+2kjSIL8aPb5c3LdsVP4E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDOB450D; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDOB450D"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b2ed25b337so1247547eaf.0
        for <linux-sound@vger.kernel.org>; Fri, 14 Jun 2024 13:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718398231; x=1719003031; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BsDvXYMdTodTTo5uSpaM+JpBiHfvPb+uVS5Kvl4zJZA=;
        b=NDOB450DIe23eTyVDSQx0pqkNdYqKLJtQIH9YOHDERdH5esGgCk9/zbuLYvwaxhZo8
         1p1naF8EU7+szgc9CnGfsFAjQCLXS00Q6t5vx2GB21q8PmjSVF0g7RLpe7ZasSHwTAk1
         Tcr9XVqwYFU8rHnBhZvji/qnWT+nLygZK6DNkGLWkqRtOrbjebqRnnBzJ65yBlrIGtLs
         QIPRF58ph287HKFP/RFybdz4h10Z34LBtLH8EOHzQYauLZn5yC2yztH8cJ+IxPhDMFF5
         JIJWL41Rf3f3B3hmX1/BxLDLIkEH07QUz7UveAcloh8z6URQnvETgxDwoemiUmJA0KPM
         fDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718398231; x=1719003031;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BsDvXYMdTodTTo5uSpaM+JpBiHfvPb+uVS5Kvl4zJZA=;
        b=K4yyhR3hxpK7sit7KlVtpRHelzrFjaQzAWbFkcrn7fV5DsddHIBTCkrnXJY9n1GoLo
         wqDtA61FVntVLELUBQVIGJPcp3b7cfukTUBtyi4DIFts289L9atm6q0XdRmwMZLx/lMx
         1Hc7Vnh4Dphz4aXg6r1xP4JL0KsiQ5G3zRi19IVaLXgxTPOQ+41ARJOKuNFMSUb8WDBV
         dRkXhTyykTOrxT/1T8jg03Kr4bap5FgXbqSzKwHot5zVO0jj7SJGb3FkWSGbVtcYbLjv
         BROk4AWcmp2kYVCNYfOeq28u+CNxPL5qE1Net+a7SDJbYVH4l1z1EW8+NR2dPZ0EEBBw
         niQQ==
X-Gm-Message-State: AOJu0YyjWdMRaUNUg4Dl5J4UI9x/OT1c+QJSzFHsqOGbFwHNp3CqnJY5
	Hyjn3aqqjZR8wTH46kLEvpgPEy37ogqMAVSQQwfC95x1U5rnwV0NRVlRfzL+RThpzxubFS3HuLu
	3F1QV2cBNC/Fw8dTuXyQZoBJNzTxNuED4Rj0=
X-Google-Smtp-Source: AGHT+IH13CP+OIiOFiiJH+3PKngi8hejyBJcN90cyx/smKFveEAXBLl0OajJFTuCj4ml/hKad7NVQnoG5F+AuNNm+lE=
X-Received: by 2002:a05:6820:1693:b0:5ba:ffcb:c759 with SMTP id
 006d021491bc7-5bdadc3026bmr4350759eaf.4.1718398230834; Fri, 14 Jun 2024
 13:50:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: benjamin maddocks <bm16ton@gmail.com>
Date: Fri, 14 Jun 2024 16:50:17 -0400
Message-ID: <CAMzLsRSVz2s1YXL54XXihohYEqknG6EeAPTGzXbU2R3-G7MkpQ@mail.gmail.com>
Subject: Sound issue on 6.10-rc3 snd_hda_intel snd_hda_codec_realtek
To: linux-sound@vger.kernel.org
Cc: oder_chiou@realtek.com
Content-Type: text/plain; charset="UTF-8"

Hello kind sirs,
     I truly apologize if this is not the correct way to relay the
following the information, please forgive me if so, trying to be
helpful, not a problem.
I have a gpd win 4 with a ALC245;
Vendor ID:     0x10ec0245
Subsystem ID:     0x1fdb0004
Revision ID:     0x00100001

It works perfect on 6.9.4, but on 6.10.0-rc3 it loads with all the
same info in logs as 6.9.x but now sound. The only way to get sound to
work is to enter then leave suspend. Its enough to use pm_test with
platform setting to get it working. Simply putting the device into/out
of suspend is not enough. Things I have tried
In case of order of operations issue I did the following silly things.
Compiled kernel with acpi/power stuff builtin sound stuff as modules.
The opposite with sound builtin, acpi/power as modules.
Also tried blacklisting the sound drivers until fully loaded.
None of these worked. So I copied the entire sound stack from 6.9 to
6.10 and the issue stayed the same. This is where Im confused who to
contact because it seems a non sound issue in the sense of code but a
sound issue in the sense of how it manifests. As I stated earlier the
logs are all the same between working and not working except
/var/lib/alsa/asound.state is missing the control.# sections.

And Ill end this with saying open source programmers are my hero's,
and seldom hear from anyone about the work unless something goes
wrong. So id just like to say thank you for contributions and hope
many more will say the same.

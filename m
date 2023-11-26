Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXvHVMCb"
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A8EB;
	Sun, 26 Nov 2023 06:03:33 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6c33ab26dddso2511386b3a.0;
        Sun, 26 Nov 2023 06:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701007412; x=1701612212; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb1RrktZ4bkYCEMmxMizeHCznXII0ae0Jpvg//TyYHQ=;
        b=MXvHVMCbwqVfoM1plKnGRxC1DxV9WTvUh3f1rhRX6/GKvR6dcjHx1eMIDuvHFo6gqj
         0IhAy0EgNRPwDp7+uB22RV/lEERWELAFwKktfe4CKmkaz1OIR/QDVieMSFY1fHLIq+Si
         FJCIdbjCQjsgkCF9XAkxS5lS6fV4PBoLUuY5wN0J1chV9fabDZcHg4PtzfpTEv4sPmt4
         Ce6mx8HXr08Ks7k4uqG5ADNAtDNX0XWk/q8S/b0DFeF+dpv9w+dqVRPvaN/fWQKyEA9L
         OH3CrCx80rLjQ0o1DbDtBX7VzttPSwMJIMcHkMaue5JVpQoIvXdAKR/HotRwnvTQo7En
         tAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701007412; x=1701612212;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mb1RrktZ4bkYCEMmxMizeHCznXII0ae0Jpvg//TyYHQ=;
        b=VpskOOn8qKyHKn73TBfihnV1/4NiOHKrErsUMxuI9iEzfj39i0H3m4rQOwptiTw1Fx
         4X+NPlCqnoDPjAHtomves2v6EiXTD3ABCwaQnJ3NHhRVAkjt9F1aQkZF/0V2HuTaFXY3
         5gTUy0/dV0vTYcyzzhLieMhMeJAjsMhYfQOURjSybrvzDXlR79hUY8mVfZfaN+dm/pCQ
         ZPmNsQPL3Izeu2UMDKS5kd80DftiyZFYxavB3JvolL2cBIpt9Yt6I13rqrRe2aMyc1r6
         Xka/eK0vh3BcYxReYjdqK223H8kbWVMRqlJBaf5cZ7V6kRgt0GAdlVQ+yQGWa+mM4oI6
         iPuQ==
X-Gm-Message-State: AOJu0Yw0HH0JWlcS3VwIR9uhKc5FO05ymTa6HSFKXSQ0DVsJzg3h+YXW
	GBcx4ikEp5sH7Y1XOP2N1HYpR1QklCFtXg==
X-Google-Smtp-Source: AGHT+IEOBWCRTRGM8IMqBu/TEsJ3Cag5vzOZepJ3a38QKKTtwslFZCuhMsOiIgsu9KO8ILNKGq6ZnA==
X-Received: by 2002:a05:6a20:7d8f:b0:18c:8ff1:f0b with SMTP id v15-20020a056a207d8f00b0018c8ff10f0bmr426018pzj.56.1701007412183;
        Sun, 26 Nov 2023 06:03:32 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id u2-20020a63d342000000b0059ce3d1def5sm6130915pgi.45.2023.11.26.06.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 06:03:31 -0800 (PST)
Message-ID: <6aee4bcc-52c5-4bce-9f79-aa4ba9c7d926@gmail.com>
Date: Sun, 26 Nov 2023 21:03:25 +0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Sound System <linux-sound@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Leon Romanovsky <leon@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Taketo Kabe <kkabe@vega.pgw.jp>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: ISA soundcard SoundBlaster AWE32 snd-sbawe.ko freezes the system
 with pipewire/wireplumber
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a bug report on Bugzilla [1]. Quoting from it:

> Kernel: 6.6.2
> pipewire-0.3.80-1 (Fedora 39 version)
> wireplumber-0.4.14-2 (Fedora 39 version)
> 
> Soundcard: Creative SoundBlaster AWE32 (snd-sbawe.ko)
> CPU: Pentium (P54C) 120MHz
> Mmeory: 1GB
> 
> Symptom: invoking wireplumber after the soundcard module snd-sbawe.ko load freezes the entire system.
> 
> Steps to reproduce:
> 
> Since this soundcard is an ISA PnP card, driver is not loaded automativcally on boot. Manually load:
> # modprobe snd-sbawe seq_ports=0
> 
> Check if ALSA is working:
> # alay -D plughw:0 /usr/share/sounds/alsa/Front-Center.wav
> Works. So far, so good.
> 
> # systemctl --user start pipewire pipewire-pulse wireplumber
> freezes the entire system (after brief "top" showing 30% CPU usage of wireplumber, which is normal)
> 
> Serial console does not have any interesting message:
> [  405.192389] fbcon: radeondrmfb (fb0) is primary device
> [  405.474790] Console: switching to colour frame buffer device 170x48
> [  405.973621] radeon 0000:01:00.0: [drm] fb0: radeondrmfb frame buffer device
> [  494.400038] sbawe 01:01.00: activated
> [  494.461230] sbawe 01:01.02: activated
> 
> Mishaps on userland (wireplumber) should not cause system freeze, so
> I consider this a kernel bug.
> 
> Results by other soundcards:
> YMF744B (PCI card, snd-ymfpci.ko): wireplumber works (pw-play -v Front_Center.wav)
> ES1868F (ISA card, snd-es18xx.ko): wireplumber works (pw-play -v Front_Center.wav)
> Vibra16 (ISA card, snd-sb16.ko): Only "Front" part of Front_Center.wav is played by aplay -D plughw:0, not working properly on ALSA level, different issue
> SoundBlaster Live!(PCI card, snd-emu10k1.ko): driver cannot wake the card to D0 state; different issue

See Bugzilla for the full thread.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218185

-- 
An old man doll... just what I always wanted! - Clara

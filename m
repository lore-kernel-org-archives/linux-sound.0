Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED18D2DEA61
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712973; cv=none; b=N+P2KHrtmse8Jh78UplHIcwMxZAQb6SBb4phZE8/NsAQrN8GOJeEBlGXwLC4JhtEmrLa9ZEUa0qpolzCNyafaMwbpgd1ezTlGGKVZfs7gGp6r1JDf4yw7b4TosgSZ+TFtx7tSYtrXJBGPOSEb2MzufhMytTMtGMgjs5DG4rLxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712973; c=relaxed/simple;
	bh=KooYV4/sSy2wXunuk2y3qjSvjnBz5qe8gv/mx84rIOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmWhcJKc9LuZ3e+RXC6AKkUK4LCSS+L+xgXWJFNmSdzaqYBMQvWuRsbnfvZz3xuJlJ3J4a4I/c39xlP0OSPuFHu+RsqgYy37g+DneoQjHChDXCpXjg0jdObdyupm0lD72YR9JeNkHSbKh/x0YyFUnUoQnpmyHSZXJGLJYMvsna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sv0lg6y4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sv0lg6y4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso29068505e9.2
        for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774712970; x=1775317770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBKZEuWHiFEkBCfj3mcTJPfE537ZSDsRThOmEl0FxW0=;
        b=sv0lg6y4iJ8JSrMijhRnEoPY+P/GPhHjSKoCkiRr6xb/zvnWmSA1TOXtA2mpqV0Q8D
         K6tbnwdqv2vyuNw/eLZbkead/gt1uu6Qv8sjNhnOiL5H9NNGpPgKcPJ1dfRjxPFXcB/W
         ahxA1FVGzG5wegdmcUihJJhqHFH/uWyMGfmbb4omTqevteb3W600ZlOzMXCWovLTPvrf
         5nwzf8WWBAEI/HgX4uLnYdKqE4Q0qg7NFrUtQSAQJAZS708JpptyC/yMGEsOKbq9CrIc
         6nzTrBDHSQrC6i3WpLEeB9WMU8Mc/fzTvx/wrPhh08wcokrjB8uhk7LIHgkjHn9idYVM
         xZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774712970; x=1775317770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PBKZEuWHiFEkBCfj3mcTJPfE537ZSDsRThOmEl0FxW0=;
        b=rQMchafhUmuRlqBRsW7CMVHpkl1IjzrDcC0gULfvZtX5TliZ1u8SOrxONFEP7Gmigo
         ebEI+cVrEHn3cGN/mU4jf1qj4yuomWbV9ZtVrF1BL+NalgNCxcDnyvJxgmypOG5Vg9L8
         UBPdT2V00jn2A5SPzoCs+/ONo7dfr7hY0ue6Pvdhbf/dipA47DP+LRKaMx5NsJPZ8JW8
         pywnSIvFPOQ5klEhIY123GmvSBRW2CPKzvRs9q8miuYqu2y0UOsHppSsfstva251hUt2
         +4+/lcH5qMmZ9S4DCeenvFmKRoAkYBlm1COGXRpomSJdLPYR/26lxsUW9uE5IGyOxOC7
         C4eA==
X-Gm-Message-State: AOJu0YxBQF6PR4Lu8h2tmDZzpzq0IW0WNMVVUOG3/Si5OXYA/btLqFh+
	hRZ/APnSbaXws95TGdBJ+4s3PUyvbiEab3s63w+APhFC72U5cr6QdR7uLSCPY3di5P8=
X-Gm-Gg: ATEYQzzTlHxiBOp3XjCyuodhDotlqn0Snndbe9o/syP2EeV3r38olCLASu2t+h01a+D
	gjiEvUyuZjbrNkNtKF2d6ecnxyIQaiH8aG0AZlS3cWVYSgIkKwbbsTMWr3Wrlb9lvR3LeJw9kVE
	RDS1bpL8dQPRucBBa+90Wz3DwDKlltug/t1pmMzsM/x+dhVkfDJOARHzQMyhVHXEi6S41bvNqzU
	LDvg4t7dlrLZHiX492qzGS/ifg8J1jyUjbAnRFQXj7cwx10ZWbnGMezxlnqv3iH+iou2pt8huFa
	RKvnjiwtxtXiagw7LA5dRD8gy7ATzHdQz7DFHUWTtKVbaI2ZADC8pPQ/vpw6wBAO88ZXqwe3Ykc
	QMVevaOkB49RZK/D4JioVRZlWHxfQStCz4FtJHPtwalp1HqJ2mb1LN1Cue+RVxiZIkWpoLnqFzz
	fHHnInDnBJwG7TBRCq3LPXYw8MuvBsy9z9adTu
X-Received: by 2002:a05:600c:a016:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-48727ef153cmr100288975e9.26.1774712970205;
        Sat, 28 Mar 2026 08:49:30 -0700 (PDT)
Received: from linux-workstation.localnet ([5.133.45.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm35864835e9.35.2026.03.28.08.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 08:49:29 -0700 (PDT)
From: Phil Willoughby <willerz@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH v4] ALSA: usb-audio: Add quirks for Arturia AF16Rig
Date: Sat, 28 Mar 2026 15:49:28 +0000
Message-ID: <2787415.vuYhMxLoTh@linux-workstation>
In-Reply-To: <87wlywum8u.wl-tiwai@suse.de>
References:
 <20260328112426.14816-1-willerz@gmail.com> <87wlywum8u.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Saturday, 28 March 2026 13:17:21 Greenwich Mean Time you wrote:
> On Sat, 28 Mar 2026 12:08:41 +0100,
> Phil Willoughby wrote:
> > 2. Add the external clock quirks and locally test that it doesn't break
> > anything for people who don't have the external clocks
> > 3. Wrap the external clock quirks in #if 0 and a comment that they are
> > disabled because they haven't been tested.
> > 4. This will be marked signed-off but not tested-by me.
> 
> Hm, a better approach would be rather a creation of a mixer element to
> switch the clock source, I suppose.  But it'll be more complex, of
> course.

The standard mixer code path seems to be creating that element already:

$ amixer -c AF16Rig contents
numid=2,iface=CARD,name='ARTURIA ADAT Clock Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=1,iface=CARD,name='ARTURIA Internal Clock Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=3,iface=CARD,name='ARTURIA WORD Clock Validity'
  ; type=BOOLEAN,access=r-------,values=1
  : values=on
numid=4,iface=MIXER,name='ARTURIA Clock Selector Clock Source'
  ; type=ENUMERATED,access=rw------,values=1,items=3
  ; Item #0 'ARTURIA Internal Clock'
  ; Item #1 'ARTURIA ADAT Clock'
  ; Item #2 'ARTURIA WORD Clock'
  : values=0

I also see it in the alsamixer UI. I tried switching it, and it does
communicate that change to the AF16Rig. Of course then it doesn't
work because I have nothing attached as an external clock.



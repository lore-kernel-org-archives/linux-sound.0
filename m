Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467432ED47
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 12:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245680; cv=none; b=MXZtyEfI6xUWXH+wOFzStQ8nxMhYx128/oaesucverajv1AWQX0hmFQJ0qfTluRXg0MK0CJnYD1qLJjK1LE+vAGL6jPXCXxhU2UKilRNJCUlEboxQz/fXeDaRCS82rNVSfHXbxEUWJVaejkaQwraRJu8Mnb9szF6ru739ebAYi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245680; c=relaxed/simple;
	bh=A77e/hF+FVPnsU497xah/3/rxCSGc8qLJvFn+V/Ume4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N7fqGWdEnnkc8tcP04FXyjzrCJH/WTC9K+GvT3KpeZDwM+Y4RF+BkyZcYkoCDaOLAEcRreVE8Fvs3WxS1eXUeD6ayB7uAUg3aBU6Gtw+OUMqftEdS4NKQtDGVGd1PJsskMHdlk1DvrPSqPp6+bXk5xkfUt/YlEMlJe9g+Y+MSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkjpehgd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkjpehgd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so5744035e9.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 04:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764245677; x=1764850477; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KmT8uMx5s2bnWUJM4ifOOUTAk1slcGUebvJGSLzWISQ=;
        b=hkjpehgdZzNizVSyzTH5jZV5dtUx1C6PvPYfXG8NmjLILOsErazMxtXs4sH/wqN3t5
         edbl9kHc7/mRt3/mrDf5Fmedfax979jPiROR5S0ObxjT5UbFFM3oTH2PYzT/e5P1FD6m
         Emsrvr5ovK8U2sEiBJzMjwws2DaB947TBcuF7kY9lTdJmTV48cYd4QAbaCqqCOPudscX
         uMiIHjqStLksulJ+g/cwsh+7XzE5Ln7vLwpzrCGBMFVUosCtrgv9uwnc0fRlbGGhcRjL
         PawD7OZNXdM1rtFP5VT28U0JBTkbNXfjXjoOcCecPo49YersF4REQFx+9CJcAt1ECQXx
         VsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764245677; x=1764850477;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmT8uMx5s2bnWUJM4ifOOUTAk1slcGUebvJGSLzWISQ=;
        b=preRweIFcvkZ85Pilap3AKErfhvle7JmD32CPYPJkdUoxAT0rV1D9NWk23ZW36TKcw
         IRDE+G3udTC8T8FM5+YhOhTlNEHOv8X5qrH00dWmPMRba+k/HtrgTVR3hSS9Y4RWjt8R
         yXXe9Kyxfxo2njjC/Xm7wP/7ip95XyqakwQtqF7LqT7J+fXzR+dx0KS+Q3oW0E3cGTPY
         +xD1vYNFfJXkdjP18Co5i1cgPwng6xXAWfIWaPeazpy+nBTarO5ySMeQJgQIvObkpztL
         0vSv53BYgkVVbzNdlio0dZvk8FjWmN/ZHoXzPpCYYZfUkf2coGllyGW837cC/lM583bD
         gxPA==
X-Forwarded-Encrypted: i=1; AJvYcCWhhPLehI4BQgt9PsZZtRPF3UE4hKiyDPRzMXs9m9XTX5/PNFcfnUny/2c8HM+TV/z+zj58LCgQ9rZFQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbuM1NS3ymTuWZzz0RaV6vl8FO1qbAZ8BjeWkppJWqiYB2Xaxb
	yZ/boP2Qwr7LqITo9/AjBzwHKF1l7F1X6KVW6NyN4noG0Jqmc7M6Uypo
X-Gm-Gg: ASbGncv1aKv4DVui8BPtzvNV5vympjGZU5wJclQTtjsgssWU/ep+CTKTpQU6CtGkl1U
	Y5uhrzZEnnrdrUehfdQV8lInyWaDWx1ovNYceftiux+sq2Tl77G7QsoeVG4aMwPXq8n71K74w5n
	fIWa8MakyDQz2UimsnqZbvuAYyvdMzU30ZrbtbR6jF9tM1CgP2LMf47+iUxThyWSxrlcY4rIG72
	IctJP5Jv5YsoXrmyt3N86XQgpHpjpST0h3qMw+lxzSA2UyMgfpeoJKgB49vI3Fn60GHn86v30Qc
	LpqBYBsO6UgE8fVeyzozvycycXQIGxt1FRAExYwRKz8xI5H43EupAR4cnQHBhntDmBVSfHUyzZN
	wOMB9+aF8DM/WR5Kah5fLx5VzR4w1AxgdSbZVvMc6xrhlmN2woiEQ81NrjjCs29FBCywARp69TV
	Uc+zVP5WhNIxndjn0=
X-Google-Smtp-Source: AGHT+IF2HYbeMeLGK2ElFV0dE2DKoh6CACU8WNQe/UxNMkss4w22K6ytAQZJSiUCkSGG+ExuKT+ZMQ==
X-Received: by 2002:a05:600c:4eca:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-477c0540a68mr260309915e9.16.1764245676582;
        Thu, 27 Nov 2025 04:14:36 -0800 (PST)
Received: from [172.23.94.183] ([136.226.168.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790530e73esm64780195e9.17.2025.11.27.04.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 04:14:36 -0800 (PST)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Thu, 27 Nov 2025 17:44:30 +0530 (IST)
To: Mark Brown <broonie@kernel.org>, 
    HariKrishna Sagala <hariconscious@gmail.com>
cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com, 
    yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
    daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com, 
    pierre-louis.bossart@linux.dev, shuah@kernel.org, perex@perex.cz, 
    tiwai@suse.com, sound-open-firmware@alsa-project.org, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound/soc/sof:Use kmalloc_array instead of kmalloc
In-Reply-To: <80668037-20f0-4f56-b0fe-388b26563361@sirena.org.uk>
Message-ID: <f8e4e44a-4ae9-694a-9fd4-bb6d5ebb8057@gmail.com>
References: <20250923142513.11005-1-hariconscious@gmail.com> <fad32f5c-f9a4-4cf2-9082-845deff309ea@sirena.org.uk> <9e808d38-c720-fd59-8bc1-d1da6255c59b@gmail.com> <19d12aaf-99a2-3b9c-e1d2-c39a77c9e1b3@gmail.com>
 <80668037-20f0-4f56-b0fe-388b26563361@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


On Thu, 27 Nov 2025, Mark Brown wrote:

> On Thu, Nov 27, 2025 at 10:35:34AM +0530, HariKrishna Sagala wrote:
>
> > Just checking in to see if you had a chance to review this.
> > If it is missed in the box, please let me know.
>
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
>
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.
>

Thank you for the clarification and the expected review cadence.
I understand people will be busy with the commitments.
Sorry for reminding for a non-critical patch but I followed-up after 2
weeks.

I will resend the patch as per the subsystem style.
I didn't send this earlier as I followed as per suggestion not to send the
patch again for only a commit message change.
Going forward I will avoid this and allow reasonable time for review
unless a change is urgent.

Thank you for the guidance.

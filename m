Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521DD2DC76C
	for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089618; cv=none; b=QoOYnsoF3pYURpB859ENIlf39vWWZqXLAty8GC5BJubo9Oh9N3w5hXevGYu4ibbD203jBeYIrN4P43C/Kn1wq8CZ4wg7QVYwHP5HSN+TW2ALHJT4ga0FkXPcHpkiCRHzTbT3iXFEHsOSfLYgol5Ll1BpoyfzVXLy3VazQsVFWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089618; c=relaxed/simple;
	bh=2NL8LuxLHtfSgogtbu1j/onmXnvsv3V+M4F50G6dnps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPJIGIemm1+mxAJn0nV4V7e1gRu1KV+EChAdyOFm0dufoYI8d+QNo3ZqzNjZNsIm7ZdnXI9qsfGJwLn/5Y3IsHiD7LjQ3pStnLSj94FtdaZhoT/7ThncYn5tskqaPvNH4RTCeEi1X7xgZLW6pw3PWiJWIMwkQEH/B0Oqyenl7+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GTTOAMoZ; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GTTOAMoZ"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-597c83bb5c2so7709389e87.3
        for <linux-sound@vger.kernel.org>; Tue, 30 Dec 2025 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767089614; x=1767694414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CX6KdMzMleaRWDbzUCLxKs01k1riiWrG1Dd4V10O6n4=;
        b=GTTOAMoZT0eIVyoo+Wfy/Qus/tlABLm8zdFWHb120gWPaepfX3Sx5cD//4SBQv15id
         bL6gHuy01hyCrqSZPv63xVuhipbaeLSg/2GnwUDGLbuwLxlUPC9tpVKVl3VXD3VRtgql
         OJxkFXQv4oMYcNfw3are/9ifSEandtNsvRwPb/ycFtYBzsmm4cWqUDDlO/a0ez6ejSXB
         H/xVD5uVSQ9P7qNn87gw5E6aPN9WrluoclP+E2s3CfUYWiIhFpP3+3dfuAavIfj56F4G
         5qODnllebmCfKlkft3vq196P8BbUFy60roBkU3Ciq1VKzMKwVOIUNOsaBnsTmd2neClE
         FUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089614; x=1767694414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CX6KdMzMleaRWDbzUCLxKs01k1riiWrG1Dd4V10O6n4=;
        b=Tx+8yHgWkZIJ6u4qevVTkGRyp5JM4VxrzRrHhYhiLovmpN8DhEpY5U+JodPLxu3bTZ
         qCrzwbOXb5RfVjwqvNcQcIgtMIIrINyZLMjupkRPlyqzUVn6zzgPELPjockYfSvxbZlW
         8rPqibgZZ3L3+SNYvqMdrjWwHftv/1rde49CtVlVL6GSOvEWjKkeJ26+RDz7Z+++uab8
         Jefl+/Irz7TmksbwPxR5UR4M0+MZKJ/F5gskKGtOaz8fg3mgBIUWKaKaSnvj9l25Qy5I
         oWYd1H9wtzWtVjNa51G6WtPaen1kt09BLaPFRAIgFfLCQAQklbQtsmIKcAJPy6Y+VHtC
         Tyow==
X-Forwarded-Encrypted: i=1; AJvYcCXo0k5Gp+p5Da+cNeGoLZBT+qr8TGdk7TwQwX7vhg/03de2jyhHF75AxgEeSbGADnzBaTgChzAHhudAaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrsX4gP69S9TZ/j0SXtuBzl9x5Js5e9YKoSxNLVpvX3PnCS+Q
	tclBQC58HVXZLnGrv6gN4FXazH5Z+uE14DQVDU7OZ1HwBn2T4GK8urxJEtf9wBWQvdjIE1qyssK
	5uqjfXmAWEmCFEueAtaS6Ont9keTEAjfR+03GyX60vg==
X-Gm-Gg: AY/fxX4ZoYyL0qDvhFA29iwGN/p1O9bRCyAd31v3ia5114/OpzqKy3Ht5qRNVYh6RBE
	1jetwjwTXl5BTS2q9LXLrW1Grfapd7ExYgLR8oGdLvyE6ycJaDhfSElyVtw4bQ7HlH/ZAaxc5SU
	LVMX8DubUcdhJXtKLXTqtKvj9XrpT6rhstFwSXhaG9USrCZnjcLJ4Gy6S5bCgx7uYTPEU5sLVFa
	KtRlTtZ9VytVTu0VQL8EXBFDQH2q3KHNXOo7ZwADDcMkPcezrUIKYLzFw6rDRo0tL3D1ckC/5X8
	CKm6xYwE/ixe1ZQqN00atfJec6U8
X-Google-Smtp-Source: AGHT+IE/FDG3OVRnzfu7gFNO6Ye2jDEbhdDir7UbYVcC1K94lOKScPrzCfTZtYFE2NJNenp7xiq54VbQiBnHAMrDct8=
X-Received: by 2002:a05:6512:3d11:b0:598:eacd:ceb5 with SMTP id
 2adb3069b0e04-59a17d0e413mr12376082e87.17.1767089614241; Tue, 30 Dec 2025
 02:13:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224162635.147710-1-marco.crivellari@suse.com> <bd6c51c4-5371-4fd3-823a-eb1ecef24dc3@opensource.cirrus.com>
In-Reply-To: <bd6c51c4-5371-4fd3-823a-eb1ecef24dc3@opensource.cirrus.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 11:13:23 +0100
X-Gm-Features: AQt7F2q7EKhg8BDj7i45SxHfmWRB__Xi367wdr1bUjDlyTAVQ1s0Ku5QXWM5WfA
Message-ID: <CAAofZF6Cw5T6uZgrdyaEYX-6SBfrVzionudsw36+uROdmiGuJw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SDCA: Replace use of system_wq with system_percpu_wq
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 27, 2025 at 4:15=E2=80=AFPM Richard Fitzgerald
<rf@opensource.cirrus.com> wrote:
> [...]
> , workqueue users must be converted to the better named new workqueues wi=
th
> > no intended behaviour changes:
> >
> >     system_wq -> system_percpu_wq
> >     system_unbound_wq -> system_dfl_wq
> >
>
> This seems to contradict the statement above that "after a careful
> review .. of each individual case". This looks more like every system_wq
> is converted to system_percpu_wq.

Hi Richard,

Yes you're right. Every system_wq has been converted directly to
system_percpu_wq.

I will fix the commit log.

Thank you!


--=20

Marco Crivellari

L3 Support Engineer

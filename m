Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E2285419
	for <linux-sound@vger.kernel.org>; Wed,  7 Jan 2026 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767775870; cv=none; b=jY8vUYvdThUc/5MGDIOWYAuQGJtA/CvQx+x3tQbLWLOTlfqZFmAKPGEsQa3KfeO8W6YiUe2aK1QMJ4skKMGn5u08B0jtR4ywx6NlaZHTeJxqlrPJJT9i/wZf55Ham7DmC5prOchCCkiMX+IMI0muvt6cP3STaPVXYIWXiDodePU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767775870; c=relaxed/simple;
	bh=PY764ibFXg4qy/Kt0bw95J7+liUuxsBFrUWFrIgDH04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVfrZhZ1MFWn/zu4z5St1suQNFh6NMrmIuncf86AI4PvsF/bnDH5ip1EOoJoIHB1saacqu/lL2C0D8awdhXBiuHPr3s51uNJQAjzWbninsJkUPINfLb8e+7itcz13rxBfZz9XIbxu/zDn4r2OacdIQa+lW373F7S7uwQVAU2WNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NhKw18zu; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NhKw18zu"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-598eaafa587so2085982e87.3
        for <linux-sound@vger.kernel.org>; Wed, 07 Jan 2026 00:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767775867; x=1768380667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sVpLDb8m2eXgkPVgpdVF3UmkKGAndEDtY1yD/Ha9BY=;
        b=NhKw18zu30uFlVaFlQVri6hBVYGbhQIGb9dDyGJ894oTMz9Db1aARxDHsDL5BX5EPH
         Rk4P24okS559H+KIFkLQwd+2ksoamxIoUKR6TdmDRZCgofdvV/foeqIHCVqoNz12hWnU
         bJEtX3NYTDdpomREFnpnwC4HrdvYedIZ20ZhMVRV45a8wlZpQJ7YiHzshR6wWsIye67J
         Q9VLGprGswBoplxldwrPJzzoSZZ4hMO2kb1QWU+WsOtz6PF5NzrQzVKY7N/TMwEqINRc
         2j1nU4Tp2x6+chT9RGo3PHODPIsF8Y9Cu/ghc2UxX9/QCFkmbroFCsBJLyUoJpWMDNga
         YsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767775867; x=1768380667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3sVpLDb8m2eXgkPVgpdVF3UmkKGAndEDtY1yD/Ha9BY=;
        b=VwX1qTCFmqa9X0VAn3fa8wE4hS8tOhsOxiUhFsBLBb7TDs2gYtYjXPGhiSgsNW/urC
         6qt8rnO4Dif8pN/ZYp/Yhr7bIQ1akUkbYpFLwu3kYdyQH6qrFi/xrBFmC5ojdWRilsnv
         kMJdtfvYpyX4M69odk1FWPE+WQTakWyD7VNDGXvNvUsBc10mw+VVs+1dFUF0jjMLLmCh
         KHa28mG2cdfHCdQHlgXTBp2TvA6gMle2J8Ab1rvVlMKNpLYEgw6C+lxBeNkTFysW0U/E
         LL5xKuWMb+I5Vr+75QCY+IMwX5V+AWnKuzrQ3xqexajIyub9Fh++JFjffQiParcs01r+
         hbrA==
X-Forwarded-Encrypted: i=1; AJvYcCWnvT0hE8Sg9a2xsWuBIxt50JSGxJdhqwOP11JzDsIN+ZNpl0hHL9Ok/PVM6wfR+l2oNLlOZF7A8MuBjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDKjqO1nJ7eFg+O/4F3ntMK1HLHbUxZXBYZR8Ex7nYkUIJPtr
	BKZgBhCmgo3rrRkppwgXW910cWs2IZFIB3Isqpiv6KH71A21TVpBO0ayaEZsm9A53a5DlFeqO3p
	HvT4sUxFry4bv1zKV4dsi8Ak4biyXgG21Rq0duHVO8w==
X-Gm-Gg: AY/fxX7SbdJqtfRmP1NL0z09O9uDoL7oDQlGIfjwFGmaldVTrqT72DPH4VIWT1/gA6g
	0EZt3n/T8JJQ+REI4rR1PzOeEu/kTFb+w/IdotorZeaSLtqqQkl+UmS1OgdBfHdWW7rzoo8m1/e
	X/4QkbxzZx8gOfZqhnauhPYGwpqXDc6viMmFUuHQzu4k8tKPY0cWPDJa+zItLMnqs9do90iKu3T
	tHRi3qNkMXQ0qFzaNUSdnBncBhresC2HRa1OdYJHgCT8Wkm+Mql5nHWMYLunRsqB9eB2xaEiIcL
	WdWXy1ih56VGD+FVRu2eKW4a2SVO
X-Google-Smtp-Source: AGHT+IGD75cc0oZGo/ea/eJz+xm5uly/S+siY2dEnALjVH+JlH7aTSVJf03uEMpLeWfjytHmgF6Q48EMHd+82+hqPyQ=
X-Received: by 2002:a05:6512:238e:b0:598:de6f:6670 with SMTP id
 2adb3069b0e04-59b6ebdda42mr649221e87.0.1767775866882; Wed, 07 Jan 2026
 00:51:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230143429.179643-1-marco.crivellari@suse.com> <176772528461.317829.14450147757093125866.b4-ty@kernel.org>
In-Reply-To: <176772528461.317829.14450147757093125866.b4-ty@kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 7 Jan 2026 09:50:55 +0100
X-Gm-Features: AQt7F2o4xIhUsPrnlsuk5GjFFEgXVcIeyergeR8uZv45iQcPvNWQHZSbez9Xhj8
Message-ID: <CAAofZF67U9ROsbKdE1RnMT=sE6UixSu7+0Q9sff4j5i=Y0dWvQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: SDCA: Replace use of system_wq with system_dfl_wq
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 7:48=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>
> Thanks!
>
> [1/1] ASoC: SDCA: Replace use of system_wq with system_dfl_wq
>       commit: 04b61513dfe40f80f0dcc795003637b510522b3c

Many thanks!

--=20

Marco Crivellari

L3 Support Engineer

Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB434C4F54
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351105; cv=pass; b=t5OqgrKeUAR01lF7XGt1latCefUPa/efWTK7hX1nOq/equCDJ8QENKTyEi4SeF7yGRbx4SN5P/7bjyjwJ1vOWyqgysGTdRvxOxXmS6qc5EOTbam7A6CBDVBcsGCFPXAjwuHJK3ppFWHJ5MlajxFyZ47EWBUTikN2H17IIfEOCNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351105; c=relaxed/simple;
	bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZWI0w2d5NpeSK4J52comr5e4b9J4/u28u4898kVaQd9WMPAjWYKBBfgG7Zuu2hVYnPBZdJQANTaAivN5XcAGJ5w+jD8lddmu5FyHJclY6jgm+CcGi4Z6eV0GFu8qvRa3OZV8Eq3LZoBZkhZQrehhMniF8kjgqx20OeF6tng9qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWnT8QEP; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWnT8QEP"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1e419so364100e87.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 08:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351101; cv=none;
        d=google.com; s=arc-20260327;
        b=qu4l4wEcb/Moj6H789xg/cdXnBTtVlLpJiTKvTSYdONvckufcJKRs2Em8w828Zhpl8
         fSYyA8n0uK8Qyx9UColH45oOgYffdDn0FKJhUVsNfpJDVuok30CbBgldZpn7S6NLh0tn
         kzlaXBJHEId02KGvdKT5jGhqhoYXy99aKEM6Ev/T/vRBDhf1xR6VhWXKz6wzt7K03f3G
         GaMUZ1H62fFRdQP1t7a9Hs2qB/Vw2yuK1sC5Sk/jjK8+3y3W9WzY4IGqCHCsHpnXGSk8
         DMrUzE6Rkiwaan5B/8yyypO5Ktl8DqXJAasrXhZelgHTN04q3RkJxE0OrP/7Wa2YDZYo
         VnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
        fh=U1RYIGaMr+gRcuo2EdqVR1WkgjXmY1nsNtEhjsdqtA8=;
        b=esX/WmJd3aR577vMzJlQXvBkupeL5GKUscm2q4T1bG5ZqShpxwCqiqlPrmgzVoSh93
         HV8fclf5EEo6UTwcsarxIdSjt+pbowIVIbJasOk/V06fL4yoNZi5VB9RyTJfVOQuDiEJ
         +87+sKG4woGndjIAQ3L9U55bDjpQexiuRzl7u+vuw/sU5MxU5efr24fJokCNSYyBscYX
         IxdlKPpkEXMQwzw2pSTqgZ59TaBXb8UOALuV7iEEV3CVoc82g8YushujsOfahjOkHaET
         8L9AakGt2EtqsZfJEjFxqrqo+e1AM7VlTdz7GFn80AcV0pnDnVf3bPweTVqa2mWk8LyL
         dwHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790351101; x=1790955901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
        b=VWnT8QEPp1GVE7wlYyyRYUXwlWdhqaWYOY7yREjTdwdS1ajtf65fdQPiwqpXB6mBrJ
         TqIgIo0BViW2SeuBJndRrQbmCwUMbPzdqcs7J7JA+tcNbq28mANOQoQD0OsJc93EsYfc
         Ryd+dPKQOezNiWgjModL850oSgwQJUo+1bNiaE9XD51B/gTZ8sR0Ers+Z28amgqdoh9F
         8GkzrNkK97H3hgZLssU+tGn2LnOrlrvyXFKDgwixmIYlbnOlzOTpiYe7UgVo3PUKaa2X
         HSE9lwek+cDOYm5yuN3bumGzkbIUlj89e/cbM0aQ5p/+Y8m9x4l/5I5RiarJ770nzxW9
         /sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351101; x=1790955901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KP5GM+LEET3IMtjIAemSJlxHU9mKTZc47mbuQjRzhBE=;
        b=MrDwJkZgbfOJxDnhcNPJas+msgZ0zuzNwzGtvEVASnaLvfh0jSlx8Vg1U3Sto7+tvg
         vwLFfJmSEz548RMzLaMaPUjZ+LFYIVpRTooxc5B2CWKGWxvf4ha7CTYhV5mAIrfQtgcQ
         USeTuCi9KNHcxOZEusZpbsFtMjrA+4Oo8mkXNYAa/lZy4hllIC1owMMQui4blkxdeDOl
         TM8Cu6bEQZv5M5S08cbpyUPQlUcJdZMyJf2PFjXzgsR4Ye7p3eNI7HK6mDp/h0bPqQZz
         hgSP50Sl3nnylMxsHTAttziIUuVTzioofPNeSEspYddK+utvOvTCal6WbMCf+Ogq+qef
         BZmg==
X-Forwarded-Encrypted: i=1; AKwUvByXGQ6NZ8C2Te57uc+Asi6MCsDEvB2xGxbRy9OKc1T8/Bx++Lt1snyTSfZylDH6cywpE9N/ndbO5FSa5A==@vger.kernel.org
X-Gm-Message-State: AFuF++lTx3aNxj5zoN+XOYHBzm9Wc0jgzhLe5Qawfuo4CITDXf9rjhfC
	gMESeGjOICtloDwWnZqXQTVSD2jDTL2a5obBcWeEdCv3iwivNGHMvDdE/a7odQS6sxweCPhaGPC
	NZlE/OcrzZmzI+5pOEn6ha6Q9k687V9s=
X-Gm-Gg: AYBFou2wV3Yl2yGr4BOTDVjfswdLAMA9mLMO+QyVl09g0oczS2pQPlcnjJHQRBRcyEb
	pBks+uSqR8kxCC7f38Ma09KD+62qdZ45wCNoKRhBTDFr8TiOzDg8FQsfk1fxuLFrUS5Hiu+BJpe
	52K0ZVfecKCaBLDAxFIeGS5keSIbpqLnMlUaoa6vsdT/Q9zNn3KD1TdszvrifQXfEX7uz/a1k2x
	U8jHtb5e7Fdlu0uBqpLd5d1IolzovmdCYhIhgjYi7CqEVq8R5mmBMnA9nG42CxRgFHjlgiva9Kj
	usEff+Dit/n/gQVkmAW1cUIn37IUq78EpbvhHIMdz6zMD/qlScifA15P/YvAO5/w4YUDB4VFGjp
	pLnKE1PXZHgQBTW4yJdy40PhZoInJIHhgIUNPWrXBQKEq
X-Received: by 2002:a05:6512:378e:10b0:5b8:de9f:85bc with SMTP id
 2adb3069b0e04-5b8df0a5e33mr1493051e87.9.1790351100604; Fri, 25 Sep 2026
 08:45:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com> <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
In-Reply-To: <4f0f49b9-c856-4aa6-b860-a81f018ad1da@sirena.org.uk>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 10:44:46 -0500
X-Gm-Features: AclHuK-5n-rkchM_xV5oHlhGXrOaf5sD-uI5jyQ_MtR8PlMTXUbFhv2e7KwRPTE
Message-ID: <CALHNRZ9xAk-eVPE2OX0AiHjRe5n6AzejZ_6peS+NJr=v2jwzDw@mail.gmail.com>
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:13=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Sep 25, 2026 at 02:47:33AM -0500, Aaron Kling via B4 Relay wrote:
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Codec drivers are not supposed to do anything like this. The result was
> > that the first second or so of playback was essentially inaudible, and
> > very short alert sounds could be missed entirely. Let's not do this.
>
> Again, are you sure this isn't a workaround for terrible hardware?

It's possible, I suppose. But this is copied from the already accepted
aw88261 series. And it has real effects on my devices. On an AYN Thor
without these changes, if I start a video, it will play for 1-2
seconds without audio, then I'll start hearing audio. With this
change, audio and video start at the same time.

Aaron

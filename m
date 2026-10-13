Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FE518133
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 15:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904358; cv=pass; b=Uku7kUUI/bPd6WZtiNkRxra9MgIZCNShpef9GDEPe2FgfLyYtLkEia+cjSN96m1lbYslL62cZD1WSlK7lHJwnCtj9+rfnrq/NRaujbJKVf8u881+MEYy0yeaoy3YT4sk3I+7I/mfTRqkbi40Doz3WzGMZnPhljEmxkOGXg+DaC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904358; c=relaxed/simple;
	bh=AI0ZNZro2e5xfwR/yU0/G9qLqrgZW5G00ldr43QvkCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEY2jUET6uLKhqZ+1lbabdsF+hd9sMiblPzg+YvHoGAv+b7IIgGDQJD4UdWH3OnViqcRWf3A2pCzag0CoSH9ZL3QfihtZOopv7cyhLHzzMDChYL528wAuua1z3h5d2nKudneAVPR+J3mn+bssK0quB41C9Y/9yB8lCOdiPiS5wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbRFI4v/; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbRFI4v/"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b0a28a720aso17929797b3.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 08:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791904357; cv=none;
        d=google.com; s=arc-20260327;
        b=cNpR5RPSvEdq0eYM96CfweRpoTZzyssEnDvCoQj/bf71JnVKfPIahMQwsrdMk68IfA
         APBYt1O2ZiIYqqgWAnttC3XVrK4D/Q0wA43oLX9pm7/tgkenyc2Z/2/OB2xALtgj63iF
         KqNmmk+2UxRIEZ2TiiV2rYdtJsI4/DPfQRE3+s6fafO5Oi7Hrww4WamHsGGm7Hz2sNXr
         r0QPYRWhLfjHl2awNNNgLod6Xpp3Nh7NLnVEQmO2t/I5OkGXdYRU3gJkL2L1mcMV6Oje
         TGPlE8REDq4sqy8c5+QVKOLKGvAAjb3pEXYm1kT95nMIMlM1IjnM246BdT4kOLzSQeuL
         TI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YafMoLqe18iw4aIAeYzIFkS8WNyubVQPGLMZPnnm2Mo=;
        fh=u01HUem8xTa6T536fDuCCZckFbueKvH87YggayjX/Kg=;
        b=Ju2jnDptW37/FIxRYYyWf+6pBGjZdMAKP5OpuFdRSYeE8DSZA2ZAfJrzkNZgIzH3/D
         6aZMKJxk1Vq1n6azIl0ExHXnc4R9GnuGswp38U/GQLH9FjGE+bQPaHvxRiA53XwR0m95
         hYRzlG3aW2bPUqSKPzdkwLVe6JwBuZGcX9Ftxu3nZDla02Bedph1obPROBFPI3S03OiH
         u9lUxvX5phF3piJlD//WWZ93X0XqEoUVOtkcTSJZwJgPUOyMUlGu+PoYGhceP5eLuM3Z
         /X8W6a4v9CF69vA6BJmYQF0HMxxYteJjfXoHAMQIQPwzrNiWF8a90D/8wZ9dVHbldOvj
         b5LA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904357; x=1792509157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YafMoLqe18iw4aIAeYzIFkS8WNyubVQPGLMZPnnm2Mo=;
        b=qbRFI4v/cDrhupon4mjfeShAd34/dTaOIaZzM0/dX5ZTBlSnRYOAe2d64gRNQj7AX9
         XlLWuSD9rfwxqrn0qUg3gWn5ibBAIp4bb8/ManXNJtHPaFduZFJufS69y4u6T8FWQs1y
         hRMuj7Xb5X6OEtq06C+fkVa3cfnbma1yAWPW9eY9r2gZNT41TnCCwla1uMVIu+p2/llG
         sJPYdg/uqiKbos3AmVem/x6+ngJUcLfEYVbXAaUy8RmDdG25hmYxmQRRCMbnDrcYsbLP
         X8StoLk+a+qciJ9mrqAIjt9ULRszHXTMOzgQK8gpQgIKLlgY4nkj4QaUOAdiX0/J9gn/
         Mp3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904357; x=1792509157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YafMoLqe18iw4aIAeYzIFkS8WNyubVQPGLMZPnnm2Mo=;
        b=qdxFh/GEGbGxt6Kpr8EsuzNs9PRCJWgikaIL/cD4JFtEFmRClwzlda7B38YNP+6GIs
         UzEM1D2YwBBM+FlwMRsfNDJN6YQvpeyCuEWyk1HlERe75GGzyxAmDSFGmaQjztkGl1Sk
         xw8qcuPBR5G6zoPVhGHftL5Qj/bkhUaiEv8RZTg8WFfTyHDnis4zumSuRf1jzggQDEce
         9vxiWqkBZic6aXMwpQrIaxqkfDDeWWQNIB4jtwi43AbJ2RmEWYwCtYR1Ioy1UCVtVpkz
         VH0di/efeS5caR83EkpXwZg/bf0zFdwqEo9KSxNUKsuWoLVyVLzlf72sR9cW+NRkBtAg
         aHkg==
X-Forwarded-Encrypted: i=1; AKwUvBwejDj7qF6biPSnQlqUCl99f6QWRy6R3DjSf+FkYitr9zYTXgYodo6f2rZ6bELCZCNRO1D66iDfmE3CeA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJhXYt1IBSXuBAvNLv8Sqo1cDMj3bkVYXVGhgbScfflEvX4Vk8L
	aWU+WdFgU4jWCNSDa2i/uah/8auQtPT9M9sPRZaMVAgXlVCbuE3jeHWbPOboiBbc2qah6VPVtbd
	elKEIsfjKgb/ThXLhrDn3hqeRTGssfxQ=
X-Gm-Gg: AYBFou0N0xouibt2Q3W/Q4lFGFJoCv66UB3S3Ah43r5TRDMh3mSiKQGZGpgtn+OTf9h
	8C5MBiTsIJ+y8fZ2XsSGa5FP2+EpoizfjEDPAm/uuCv1lMG0JnMyxuphHN9Pqv3wUyNf2P1q1aA
	h/Jth8aT/61J1s+VtjwRGK0Jv0CoAK0Ak2sL2Gr8HAN872m6flnKgjgkcin5nMdispkkPcmT2uH
	NqzWGAKWV8QFavAzimyxPMjvFNaN1KZbz/wl9zf6+bn/M2DEqJPG+7CkcHM3HfBxOgBmoUzk9Fy
	PqusDrL0P6y9IBlpX8Dv5oz49bT40B4vEI3WbMgtFwm+kWJ8XLoBZg8i6A==
X-Received: by 2002:a05:690c:ec4:b0:8ae:845:5179 with SMTP id
 00721157ae682-8b07ede2328mr48534107b3.26.1791904356554; Tue, 13 Oct 2026
 08:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-c2667fb9cc42fbb7943c-v2-d4b95981cdbb696491c5@gmail.com> <877bjmgc5f.wl-tiwai@suse.de>
In-Reply-To: <877bjmgc5f.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Tue, 13 Oct 2026 23:12:25 +0800
X-Gm-Features: AclHuK_LQ8g9OOiFHhZyIZww1_H2mRji9cKUZLRwzcXhSb0U5WxNj3lClm_Vg7c
Message-ID: <CAFRLqsWGYjnFv8yc4V7_r7NiS2AJ7A5jDN1wx6PV7444TJjFLA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: Serialize virtual-master hook registration
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, 2022090917019@std.uestc.edu.cn, 
	hemanth.selam@gmail.com, nfraprado@collabora.com, songxiebing@kylinos.cn, 
	sammiee5311@gmail.com, kees@kernel.org, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8813=E6=97=A5=
=E5=91=A8=E4=BA=8C 17:53=E5=86=99=E9=81=93=EF=BC=9A
>
> It's not nice to use such a low-level guard here in the upper driver.
> So I guess it's better to move the rwsem guard into
> snd_ctl_add_vmaster_hook().  But it'd need to pass the card pointer,
> too.
>
> Alternatively, you can rearrange the assignment in
> snd_ctl_add_vmaster_hook() and put a barrier to assure the
> hook_private_data store, too.
>
>
> thanks,
>
> Takashi

Thank you for the review and suggestion. I have prepared v2 using the first
approach.

Best regards,
Cen Zhang

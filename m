Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E173841DEEC
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204077; cv=pass; b=uEnDmfXmcRfIsqjhD+D6PrlSLW93Yrfmq9HH0g8XOM/lLcs/kLcjOeQCnyOlOSTyxML8W7uBt8FLsIYkwCxdeAesb6aDqlhdgzwI71+kTdRqcHRbQiV4ygDushKZcIi7Ce9QgFs4h0E2GHcuEVFzRAXaiCRr2uOh7260Wzr1y6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204077; c=relaxed/simple;
	bh=lcSEEoLh9v8Xf7iYjsafpgfNRcSeRiODoC8LvbpDzQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d1Z5RHMmrvwCewoOQAzuN0OzPH+W0yUVtDupGQr+p6XmVN8YabbspebDJU1RbWlxJOGjro1LTW3ZfABVnUMdJAcr7oPqdhFMFZNcZUiYbfYGUyPP7MsAK6MT0FE/oai25aBaP/VIeevBDx8ezrym1fh/wn8hNUXbuOCncPbPAPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMiUaowT; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMiUaowT"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cee9b74ee1so30790605ad.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 05:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784204071; cv=none;
        d=google.com; s=arc-20260327;
        b=fkv0ENlTfcrjFSUITCKr0rF8NLcIdYatsf65wRfLfUdRPXmqKPvDfiuZOJPIgXKBF+
         d4DyFhQ3IkjlZ8YfERJbCpH9LQuMFBcj6xvVnARUFWX2k9L/Oqh5QxAiRXYk1pi6bwqJ
         mTQ5UniBeer+inIqrliaAJ0POGbPtCyOwi9IXjHFQkyTOdxu1kyvrMOx96mCFFRg3sbj
         dp4oKP2OTlEqfP6TLrI+kAHJlah4I253/kOjHxbFBUGbRowrkF+eDY46DHVNCPKgMi0b
         6nXglYR3GFt5xuYVBqneRdrelXFcQQc7Tjy/LpRIY3LJ20xU1QGhgfyPrdszflpb5iRT
         iuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ug4bYKwXfbQT2hm2q3vkYB4jylkefy17G46vSIaZJuQ=;
        fh=74uyyUaNXurtXbeAtg9oSm7GbjS1eaa5EJ+2XPPIFnE=;
        b=Hdocm7haD8jkGewmMUpGi0EAPCqRgjdaLggqIhrT/hxFGgYwnFTXMlru4A6GxtI9VQ
         nXDJR68ZYFrWqBh7NAQooRFWDA+C8rw5junDRP7hWjNomFEMLUQ9Q4gfT3vYk6dskrq5
         UpVPJlGSiOARdpY5QqBm+/OByKthUfrnNPqNRWl1hjKXy6FOrRHAD5KALmXLZiwrdYlK
         jL2xR9fbA8LOr3QUibaOVK4ok6HD2omRr3Se9Cji5tlLIeCJnvf01Iw0aHXpwh06sHDQ
         sbHaTzDsd+Nj5VU7d2jB7BP0wk2VFMGAWcgA97wVlZ3O9ByBE0txKjBKBAK6+txqQtp9
         U0yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784204071; x=1784808871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ug4bYKwXfbQT2hm2q3vkYB4jylkefy17G46vSIaZJuQ=;
        b=nMiUaowTSepykKrgGQO6bsKRQUzY5Blsz/xJoszlXkdNX0bC3g1O4lXMRqu2wvEGKd
         vayJWqSCBblADgJZTHb6mNENpoHnBVBsADZxPxl6oxFQFNuJMO6TgVJndlDlI1Fi9qsW
         jGfkeeOb6jdnxB+sUU8exuUe8F59MQamX40euD/8EK/PTWUWfyyfct4qbUixy8jiBFr+
         d+fxXdhvTMHbk4j0XrBMkGGKFL+zQ5N7aj7TP0+qvnLHe3POZUDaa0ZkUq/BKN+kaE+9
         zuGkpY5tZx63bWwfn66hZgiwAX0ulYxXnTH6A1yeCCJcR7EE1KT/RQqylyOVnPDQUlPy
         YlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204071; x=1784808871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ug4bYKwXfbQT2hm2q3vkYB4jylkefy17G46vSIaZJuQ=;
        b=Uc6sWKt0DWwdLvP+isJ/qKdrhMxILjqnmpKRB5R+7Vs2fGIbnyhByGFnXolzGpuXa3
         soRvQb1Th4ou3GhsX0pM1zXE5Bh8aTIWpynmW89TYmW1izTODD0xadbPRWO8K9KWZhJs
         QL4Uqxopjn4+8aQbkwGgjCvz/UfH2mpk3GDx5j9ULwcOnkkVaBxtOXGckF+4NA4+BxfD
         72uiv/+ALoQJlE0bYTju6b/GrvjLkfkEgLx1uZOfBt1iEkLN5YXS9WAkCrYhLpiTkSiB
         gveIf1511BU0huTXQynKouZuzeIMnDuETDY68TO/nuLUNyQ9jL4p+VdWjxB4wnq3fOlf
         6uWQ==
X-Forwarded-Encrypted: i=1; AHgh+Roz9ytzgvIRIsrILpbvAsnJ4rQLYnHK3tIXT262KnG2vHk2CBIDdAIjd8le45WaeYEdwwgZjtizZ7KG2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+QHc6KfweUSiz2+XekIZhfXAepHVLjbN7bX+0/2Fx9mdMKK7t
	4SuhUJNgcthYbFHsOUjlzGzlJGOSzqfg+PtzazP1BmLcuC2cRJhBTuFU/uExaeMbOVa1JsI3y9j
	+7Yvg3RYypUS+abrF/2CGRMs8sHFINWQ=
X-Gm-Gg: AfdE7ckoxz5qyV3qr2EN9UbRqu90UVUPNXHJsrdDA9xM8CfW+GrgxumN8PWN1kI3EHK
	saYoPTyg6NzCeA0duo1kXXu5CEITDoCIuXua3EP9i9zx3T1Wh06lKMGKViAsOVqVDEstcMiBIsK
	AbfXV/UB+C9KROHeaipoOinVIWJeHV7LFFkGznoUyDDxgJfz878Xp8bQnHz3xEWY88kPLdwaSyh
	BLePt7CkIi7BaPh4+8kV3tBUhC4P9lbEzHskUFSDepvjj1UQ+URtIJGrS2gGYv798g/JXgp+1yG
	u3HpZfFSPaWxp40kxOUU+F88GyKuCoW0Iojb5IYUCHJlKPeZrEo=
X-Received: by 2002:a17:903:3b87:b0:2c9:feea:4e4c with SMTP id
 d9443c01a7336-2cf03ccd601mr69322415ad.15.1784204071288; Thu, 16 Jul 2026
 05:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716090829.72082-1-phucduc.bui@gmail.com> <20260716090829.72082-11-phucduc.bui@gmail.com>
 <3940b68d-da97-4e27-8816-e912162b6f62@intel.com> <CAABR9nGtoFmHjUcbhKxwY_-YJ_Kb++OVN8YkZKvkCMgBEHFjjQ@mail.gmail.com>
 <1d4ebb0d-816e-4176-89d1-065a7bae00d7@intel.com>
In-Reply-To: <1d4ebb0d-816e-4176-89d1-065a7bae00d7@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 16 Jul 2026 19:14:20 +0700
X-Gm-Features: AUfX_myse5tgm1YTwzCHXWkFCHHBgR5UcKx6TYrnuC0pMv5Nn2uGIgWyUW240_I
Message-ID: <CAABR9nFHLzxVvtT+mjDyvqV0hNc5RdJiPKMab0Oqiwqokf3zcg@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] ASoC: ti: rx51: Use dev_err_probe() for error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cezary,

Thanks for the advice.

> >
> > I've fixed the remaining instances and sent the v3 series.
> Another round of helpful tips: wait a bit before sending another
> revision.  What if someone finds another "small" thing?  It is rare to
> have a good reason for generating high traffic on the list.  A day or
> two of break is OK for simple sets, week or two for features and such.

That makes sense. I'll wait a few days before sending the next revision
to give people time for any additional comments.

>
> Also, please do include reviewers when sending updates - you've sent v3
> without including them (e.g.: me).
>

Sorry about that! I put your name in the v3 changelog but accidentally reus=
ed
my old =E2=81=A0git send-email=E2=81=A0 command without updating the CC lis=
t.
Thanks for the reminder, I'll make sure to double-check the CCs for
future revisions

Best regards,
Phuc

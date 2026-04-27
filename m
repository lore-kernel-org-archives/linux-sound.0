Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A677368282
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 05:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777269533; cv=pass; b=jCZYozyU2a5lBeyDTXyVEpz3ZWFHgIAHXUKcLADKzYwXVF0gpPlXn4rwmXIhHxNkHCnRcGsen5gN+9+nZDc6d5AIUrPdA1WuUBJaj0N+rEmreDZf7x1zLhL+PtE1fX18T4MA9VAjyVM2x/7snmFrD+DCmoqpZ2lVriR83XYQCZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777269533; c=relaxed/simple;
	bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtVeYgrMRejG58tia4aYzqT8Fnjts4Yur33o5gl7YT+lgnEPd6oVwGLsBis9zxkDVk+8G0Schhn4smURe97cl1koA3jUbgUq/8n1ZZAVaQ+BXWLXhZYTmolAclUTiKXg/GdbA0uO579wAhCvL/7bF+8zNgPUajrSUWMjjJ+Uq2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRLqNM+R; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRLqNM+R"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad617d5b80so57367135ad.1
        for <linux-sound@vger.kernel.org>; Sun, 26 Apr 2026 22:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777269532; cv=none;
        d=google.com; s=arc-20240605;
        b=OEATLEOMorL4EsEHcSQKPMdmj1vQ8ShEEsw9WUcbt3Dva5BtoPNl2VrWOMedgexUU2
         Z437+Agp1y7NnkEUj30xjEZGf8XrTvSncEJ6rOC2kFcA+AdMYTp/vTjHApbXxX/pjewr
         2cKmN+SHPHOsrd4u48Y5/qt9w0IaDHwXCw5VO78sVtQqr4x+NCZk8U13bprRCoI6nLdP
         WKu0Wi5hiCWCOJvT9qTfHc7++nBi++0bzskCikY7hqoLVtphwddfx/fw94didvVgkanI
         P9kjSjv2xGMapVkgyyt0JYoNL0kewCp4r3YKTIXv6a4+vRc/hphzdkqBBUqnqzCfFH9Z
         1SjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
        fh=rqHq8LXi5uujsgYS2rnv++4meimnLMzLmoS5ZW3X2Ao=;
        b=VXPkbzPEwBVCwwYva3FvFGqMByMMDi62TwWk5C/vyo7+27IrDPns0T01HmdMz98e99
         T0J67QyhjUF6i27nREdcEXerHwjpGUHWeqsVLXaxpFIQnJbKEqZm2MrmvZEOstm7cXzJ
         Mz2armi1LBRdZYG7KhQJ0ow1OftdVp8Qf1qBf33crhLbTnD/zboYkvhdO3OiMHqbv9Xv
         Y4jOR1pVgRf9PV7Bf/m9dm90hR6XrLfhDeG6J1gmzbGr03NCxzz1fBFo9tIdrKBovBwv
         vlcv5AkrNvz4x8PQrbLGLacQGwn6u4wJLVCagS7d9TrnFiKIwLs2Iblk6YykumhzAtuA
         506g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777269532; x=1777874332; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
        b=cRLqNM+RZ0eSlr0b/f5VHvG6xvQp/V4d9CAb7WnEy1FxA1QO+qhkiohbI8Frr1yU6W
         H0qp2wJEfXxqSi7RAAGPJhqiR4CNsXEPvu4nd+bnwLf2e8GZ6lzLDVzIuozXsN415J8C
         iY1nEgreg/eOAx+J89YBKTVb+GM5IoYEbXJK+XM7X9BRtJGi/D4xntZqAEL5OMnzr/yr
         0JYmZaOZ+JbsF7e4rD5ySfWbaovj86/LsJb8o/QSWXA3I6bVgAgrkz5AtDtxw/Z2cP4a
         LywaGiMxuu1y90vgxSdTFmMTTE+wpK4vY9yeQSZ45DMQ1JEA1zMueR0wSoT9CIhtSnti
         y2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777269532; x=1777874332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ5h4eVtRF/y6Adws9jUvUy7HiOD+nGjFS74ZRhnaHY=;
        b=qlLMjzBc/DwuhlIzJzWk4sL3ofZ6MNixpCgLTEAlTBVV6nONgbfOo5uB0pekBzgnEe
         7itAufn535YOXb1wcjTD0Lj4/IdjfyqQE0zcVP457e6MQYdMVJMpTKeQq/iq8RYjh5PA
         +wCF2BG0HqxUKeK8Nk66qzQsre60y2ivfq6tml85JBkRXJ81YzWtfiyacoEoU21uQH6c
         RrTZQSy4Rp5vMKgmZP7IjW8PKn8CmxJKjoVGIvFZYenuVeCGSwTTBAqy7zRPNksp5fAD
         BhD6h/m2epjpHaFGkPQOEvFGrok7/WcuAht97jX9gFoLfmOnAkljgfImh/uv4LBCtgO8
         S7Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9kCa1ggHHFJ3Ucm/+Tfg+ltJ9hxqnWFTgCE2HZEAYWM/KM8gIubjdWMWpacSPVBnffVDxyjYei8xwsFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym66ZvLbaZVgWFGXrqiAJDoRfSKs/5u1jqbTum2CWEIgNQJ15I
	zm4eS9a+BL6XYysNE0q7AH+o9c5VI3ioupuftcDHIAmOYPXQsD/XT1SVoGhLfxnarLm0zsLejol
	BvcvNurbB2Vl9TymT6yulUUX59V0+j74=
X-Gm-Gg: AeBDies1rfvIPVq0wl/09v7fsiNimOOuNoPeAm/9q4Aj7Kpi5DMDH+sn5GiTlbM9ZX8
	BuTWB3L+GTcFvVVAv37y1FPF66lqfYb/URVam79TH2m2QFTnavCBRC49BpiACcZkytYwTDb5Lhg
	Yit+MMEjUEj9MUgOSkj9R3bYz0MhAFqSwjklC6GhoN/GMTVolywgX0BI38ZGZKMLgtq08sqn548
	+v/DQKvoZqpwOOF60hyleYNtfJB8/i/5RBB9nCRzeWrxjK4UjpjopRcOpyyP5QVmGNszR0Afohu
	D635z52QFsFIoREQFaccJ6FOWqzVYNd8iUHmA8wYN+a4Hh2cbkekONqvxky0wLDm1lNbH08wnkA
	O4CwffjK7
X-Received: by 2002:a17:903:46c8:b0:2b4:5f83:a9d6 with SMTP id
 d9443c01a7336-2b5f9fbba9cmr423017415ad.34.1777269531920; Sun, 26 Apr 2026
 22:58:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423125154.156257-1-phucduc.bui@gmail.com> <177724034927.266775.12675076324275289049.b4-ty@b4>
In-Reply-To: <177724034927.266775.12675076324275289049.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 27 Apr 2026 12:58:34 +0700
X-Gm-Features: AVHnY4Jc9P5RStYCGah8cZOylaS3eZSUurg1lrhWabGzqo6DH_6c4mwf2b_62Fo
Message-ID: <CAABR9nHn7qrXnmaaaST8yurc46GZXf3iARjQ9BuEb-OPtvZqQQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: apple: mca: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for applying the patch and for the explanation.
I'm still new to the process, so I appreciate the guidance.

Best regards,
Phuc

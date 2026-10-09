Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F085E3E1201
	for <linux-sound@vger.kernel.org>; Fri,  9 Oct 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530491; cv=pass; b=LzpJSYtp7D6Wtmu4XE1wMtwQyNOkXoGDGxmzeA4aI3fMBZJ84lUbnoxCqh4Jem4aFBy4uHL3qIeS3IxATIU/fgFK4AHS4YBptg0k7Yn81pn1qOh2zCXp2+1cz9MdRVzprR9CsE9D4bGc4DsUVcOKsVHiYMzjKQL6iIxnkBZa/hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530491; c=relaxed/simple;
	bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAaFD3DfkQWBeJ+9LQhct6OA5wggu7LDT3kdc5IgJhykT1mBI1IkGz6mLWwlpV14hX/VimKC7MtnEYviY8uI5h65bJDeRi0WRuYjIJaVHEdeBodmU4VjMw9vDGZxD68x+4sOZ7zc5mRQtAgeCIdbHrjYPsUcxYdBNxFvIDvi5kQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fibpuUQ6; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fibpuUQ6"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so4235068a12.2
        for <linux-sound@vger.kernel.org>; Fri, 09 Oct 2026 00:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791530488; cv=none;
        d=google.com; s=arc-20260327;
        b=Rme4g2xl160GbSqzaFAiGuv0zmsKeAMFB5HbhLD4ed3iwc5xiTQ0U+ApEDxlrNm9vF
         DGjgkC9WqoX9b7xZO2Kr+IsVhOCkBAE7Qmk5vkergQE7ghO1rrZgRdfA98L0LWvG6/06
         i4B89zn/jYb2EH1y4EY8mn7LwRmG1uaFdwO/iJQXiGF5H4YQGwTwCKu6Dx/huv1ElYt8
         gh4NwwE44GiEZjOUyQ9npDj2laDGVm1YDrvYmjoAksvUuCpBuSweltGQ8nYr1bIu4MRF
         aomnzJfjOfqTQc3fHmnH4aTBjEX7lBRQ5XRLjW7/up/ePqP7vOfNRy4YBSpFMHC0OX8D
         SpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        fh=0+usEXNAEQyTVluPggaeZrQ3T5EWevGvGY7hFvbpYzg=;
        b=CcZhpezAVLVG1ngxSAGmX6kDW6TbMDSkSUjEEix1raSIOKka7VnEzlM+oarWvY/gJH
         PhAiZ1GIZKURGJdVVgLXgKepM5yCG2Ssv5zTctFoueJ6P/oXzltq2zGs2lMnUbzTSpTt
         yQlW5PLK4PxwmCGOvsCVYJj0VcMj7bv14aNeq3MP1BDd3seRuSvpqVNGPhmom4xZlCUA
         vS/oPnW7Jh4B5j184Ht2Amc21hsTOgqWRXDehC5kCipVeU5QCxrxdv9yU8i+ce746cdk
         moy5UdFJmWQp6g6ZoRZiWPZw+PZjiA9/TnF4kmRL4y1rzgpkQpPgoVUZMIt1USzSwtfa
         4Dxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530488; x=1792135288; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=fibpuUQ6gpRtjg3FaNafQrhlsjuRv7HqiybEQKAJZzzr+D2HjuxHaDGuIYUR9g4EHr
         euEL/J87Gu9GGVt1TxKbQeo5eZJEgZ63s63q0c7Upnomojn8htmKQSHjHy5MhD/TccEg
         NGV/2rwu3+J2+UoOF702JB7jkORqzO1GjwdSzCrKIS/0H/VjnhEY1cM3FOgvSwuImkmb
         lNkJM621PxwOloDC4h5T6NSHq72cABy6abcpvkeJNtDGuNzuR+lTZVLxWxf1mmrzb343
         UgWTp5IT2eU4zsiWoZ9dGZsXyX2EGbMaPjuZIsQsn9m/ZA1Xis5L7o2e6Q8vRtHGwzxI
         vsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530488; x=1792135288;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZWFUNR7NkCd2nR7CmmLol21VHCNc/dGraaedEy4x8BE=;
        b=xPYVhY4E7yZsHShBoPNclo3Go3P6eJPMwG/TPICcPTGrfJqiqvHSzvIQUEJyp87EWf
         UE5NrLuvkwyhQchxDRJN5LkRfuJLW6IB4WkDgYbSnhrugN3hZ7fRZ2WiZBI8ZcxgnnIS
         LzVVd/O5Ozp9rQd3vNG8amYvUt18GHgS62vbXNx5DObUFXQj4CUp1fgRw2LSczY14ncy
         YWd03GtoO69qZW9xBALVbCGbpuHLUmcUpzOnkzBZK225E0d88Ddozb7Wq9XKzxtU92q2
         P33ZzHhGKaYLHpG7lVJMK66PhXd+Pe7nbYMmpxOynQDJ6Jn20lVlWvxXNJh2W1rkKJxO
         wq1A==
X-Forwarded-Encrypted: i=1; AKwUvByzyaVkReRgsKixHnuCbMO95bNKKfvf6G7GrRu85jtDND5rNK1hfjF778icU+8xzaiRavtdNBbnEsfGzw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL7mnWbUiNGhUa8p3y1CCHLV8sSxxMm6ky1nMtLeXu4GT4b4Pt1
	GaQL8hYvAl49GyXddG7c3RxRvYStt4+IdGK+MLwWE88/uXAPrOab0LA1AtWmHd7aClx7x0d+eXR
	iopmPgyIZkaWwe/spOei0g2+Ml2i48HU=
X-Gm-Gg: AYBFou0f1CT6lCYaAd4Ia6YAiKXOF6wHgkY7dx1Dc3UyAcs0sGE4Ri7D2UqdEnYRK+p
	1FViR1Nt9ljcRPh+Fs0YwZCwTO7K9cN11bUWej61/y2YqfPartnGU0/UzPzeHth+ihjWCN2Hfdc
	+nH/a/iq10O8gMOy3StRhN6BojwSwwkXbw76hLnGN3PgkKNbiX9IFR1UGM2vM8LndGwRIgPK189
	/q5sJUiRVUtHvZm67cfDJ1hQzBGVBb8MitBWfrNaFYNp+qLIKhdBfRkrwlc4xt7o23xTdeTxs6L
	/69ZTVwBPUla3lHLS2yYazW3aahm9Xwjizn4OTNSRMjGvqFxTjFkBBxrGQmMplpSzGUIC/3U6zl
	a8/n0HZPo1it0lM+5JtTGWmiFuTV1J00erbdtt8wBF3AlnZ63wKwOmGCUItJQlOfcYbY=
X-Received: by 2002:a05:6402:2489:b0:6a9:aabb:5364 with SMTP id
 4fb4d7f45d1cf-6b17c2406a9mr722739a12.11.1791530487888; Fri, 09 Oct 2026
 00:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005110257.50145-1-phucduc.bui@gmail.com> <20261005110257.50145-15-phucduc.bui@gmail.com>
 <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
In-Reply-To: <24ffbf82-adad-4153-a2b9-f2123189c722@oss.qualcomm.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 9 Oct 2026 14:21:13 +0700
X-Gm-Features: AclHuK9p57z2uGUnULQbpxyjyLXl9q0M8bfa39_8UwomVGEzhtoBlELb83gkc1g
Message-ID: <CAABR9nETXgKCex=sDx6Y=eJOTg42oj0egGv6268T14v510Zf5Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Was the intent only to get the DAPM error log
> here, or should the commit message/code be adjusted so the behavior
> matches the "properly handled by the caller" wording?
>

The intent was only to get the error reported instead of silently
ignored; the commit message wording was imprecise. I'll reword it
in the next version.

Best regards,
Phuc

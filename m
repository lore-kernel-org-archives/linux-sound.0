Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413A345FFD0
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051131; cv=pass; b=szaPrpIPfD9Om8xLZDYTX3D18TkKg7jSotJbnbHiyfNVETvlFAWdmEXiE5/Y45otMpmsPtzjUOlAl1XI9iX7JNsfiOM+6S9Y/rzeUXekck+hUKXQoWs6AY/GTX4sYtQtwkge83gryOA6jUP/RUNj0HGS/XCU9GhsWZt2eRgHmC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051131; c=relaxed/simple;
	bh=jhAvDc6b2TExlcJrpa9uEMLTpRopN9GkM/BgNNEBgm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CL/bOarVehtgFWJKod2Dbwd55lfRHP+sH4eqgb3/eeMQAloZJqZnEz1aODAsUh7FRuJ1v245n8JcsxwHrvkuI+2WE4qR20/HnrfRcL9e1n0HDHrIljnzl7En+zbLDPf/N0prhNXwCdkGGS+jQD8n2K7CIz5j/a3b2D+KwK0ujEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwagFNvK; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwagFNvK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cab973140bso67756165ad.3
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 04:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787051129; cv=none;
        d=google.com; s=arc-20260327;
        b=afaoJs0mu6EcTr410e0IJ5Jx1vhFB3GKOVgeQUEbxE/B11FGaxWDTqDcl1bfs+MFc+
         O8ubeLoX/tbmBmVZapeBoIDgPNgEK0NdoJGR9vrpNvl9Lh624tKWWviRZcLgnbseyCPQ
         7uDTctjHN9FZy+J/ajQk25HLXQV/lwGXj+CO1Bh6CVO+cb/+NEZyqkEjBZ5ZUR8O3VMa
         2RKix0HOaChK5ohvPUpNpfF1+926wvCdMBueUuZhcE5b9/ujZXFBvAQXlV0gWkLwNF9H
         WwiNLhQC58py1eDr3P24ndAtnZMt1zWgkgFv0Ajpw40ccLfzYD3Bs5x1Ltean09CLwQ4
         DNdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        fh=i7O3bCh3W1hIf478QSLMo6Q6Zhq4BBciXHwLyMx2yd4=;
        b=gAeskNHYRkTk5j6qDeg0RNQA/t/xidy4NDh8CX3Jm1h9yO/1WCHIn08Oo4Q0xk76M0
         MMKlUgHUn8FSxnTwTPh+llGYiGHvaT2d4vhfi3QaKFLW87NHQQ4g206iSvwPYQeafGcW
         1WHSgVFHKa68cBl2LB9naI5VU1lz7GbxZme+4M9DQH5Q98kkISh8eYCpqevhcZOEdiWJ
         umwCCEjWXnvjsCwNGIwHWYU+l1F1f24wPjV1Ch+4pFNompOT7HHdc+428i6LbNtvIfgZ
         m8K4lgTSk9xQqXzTb9dffsHzImQu2PFrVSG8QzH1/Hz4wGybVmxrQjW38gUNATyENDgj
         i2bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787051129; x=1787655929; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        b=dwagFNvKXqwGjDvRwB385k0UpePQmItSNy6jq9eqd6dDHnWjvDVbMrMXphitmHlVmq
         KaEJUOdcGgatvRPW+AxnKuxo28uv0XQJoPbZJYwLwKv1C57hEjEJg+WZvDtXous+3j1A
         9TEuklFJCHRCc5Qps/yjY1ipUqYEaD1j5Goff9w0H473h6cNozsVwDpKuzXWHat36Ww5
         /cCun48HKHEaD0zv+E6dpCgz58faPcAZaCXjmSjx3zdCc3CEioEXjZTa417DiXb72gpS
         B3ChSxG3G4PFG0VU6Ki4zmxurPbhm73XDiT9NsdxR1RetEAFsTQsgEBP9vsv8VNtdI0w
         cz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787051129; x=1787655929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s+uAxg3TA/f3u5uSrt+Afuc06bBDxD+K3sO1Y6qASVM=;
        b=IJvPQWzKyj+Qfw48he9kGUgF5+t3VdVB0he++WgGEfmVUu7B1UVqwHUkmoruJxSTde
         rfIdlwaGIU6fCb/buIaATM3C8eV5Byz/h2BLyLMTGkxkpxBSQEoWHFbTnUl2q+NAGshR
         qTiYcV4ypwb86eY+9nSuZQm5NRow6WbypDltfQ+Zn7vCbjjlB6GxkaSHzcgQtRRkNElf
         v9JpGnRg9AOstovXxV28EICWUDpLUuLeYEfb+njp2IzwEMPmV8bzdxyXlD9fVB1vzB4n
         C3865nt+yUAugRmeQMnFzdPpCRdzJUGS1nBV5z1wFLsuYGulRfslYX7jNyMsM2z+NFY8
         motA==
X-Forwarded-Encrypted: i=1; AHgh+RpfT67oP2tP0Y8iGFFPlOz+6J85WpLY8dzhCOWfH63IlsGRzfegf7S7gnZYtBiwQHyHXsVAwsIz+vpFEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVm+IHNzgp/Kp29xDjTwQwFSQWAIS5ixilOl70JDKtGWAaTJdI
	Zc2nUYYQP1Gnez4ewJvukpM3xrd1vm4hobOHfdwrXPGVtxNBoY/mgiPhO/HLsDidmFgiHAZFWMD
	Q+/tooJoUK7X+g57I1UkrEsUw2AqZwTZU6wdq
X-Gm-Gg: AR+sD13iyRkhiAUMJrSlVbI/joZH4bPKWSjZGmZCLdKfk2/HaUbAzoRKR/lxsuUSORK
	5BTZxBNRBBTOl3NSHi49rkicpc78SJbbrRS1xxFqKZcYseE5d5BiCmZUrT5PAUiNofKkyc7YZwn
	KdjVoBpa19yveSF2863q3GpmpHpLzf6AJUpRblHhMuJKAvn+1tPj4f2z5M7fYlYXNkKhftHd4S/
	tFZFCgCm230lma4g7hZ5Q3/wIWGO1JevJ7MHGO0K4va6KZ//dQaU23Y5zRUUxlsfnrn0nTkUm4L
	Zi1FvR959GoHYCq1iwPWWGV9LfriWMuryasu3tnjlY40VXb6QfHWqyahGPuvKh8GSjW8zigj7eR
	hUENm9B0IZuxdt396NhyuGHpSj1u7qq8rCTTquZD7ZwZ3Y2ymOEdg6BI4uNE/GYykNAQb
X-Received: by 2002:a17:902:ebc5:b0:2ce:93a3:c16c with SMTP id
 d9443c01a7336-2d3b0c67d8fmr411073255ad.12.1787051129625; Tue, 18 Aug 2026
 04:05:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817113249.69252-1-phucduc.bui@gmail.com> <109a59a6-0b3b-48af-a274-c6a58e5c7246@intel.com>
In-Reply-To: <109a59a6-0b3b-48af-a274-c6a58e5c7246@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 18 Aug 2026 18:05:17 +0700
X-Gm-Features: AcwNN1VRMmNaNH1aGeRP_HutF8udUVlQulWPHS_o-R-KQv4XRkLCKBfpTC2ozPY
Message-ID: <CAABR9nFdeXvEM9zVKWN4o3-fX00tzZz-YOoGo492yUJ_ZPJ5ug@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mt6797: fix wrong unwind order and error code
 in enable_clock
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.

> Aside from my comment regarding mt2701, this mt6797 series should have
> its title updated:
>
>         ASoC: mediatek: mt6797:
>

I checked the git log and followed the titles used by previous commits.
However, I will update the titles as you suggested.

Best regards,
Phuc

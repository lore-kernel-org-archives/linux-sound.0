Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6A82F6563
	for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 08:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761209512; cv=none; b=VRZBy64YdCAl0tPnwcyImyPj+RKOmJJs7fnBVsHButp+Qe2oKV7LrT2s0+NfzMi7rUewNCbz445TEyKg+sqj8YNxVpKGFRl/D3ppOTPMLpusRFcBwQ/RQ71TyDBp5gJMhzkm0e9OkATDM7E7zT10dZG0U7OPpE0xEhRTMYXG5l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761209512; c=relaxed/simple;
	bh=Lia0EGpI9PV6Wa7Mt+zwkxVNwILAbw34cO4vX/DEgGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWKARch0uiz2b6Pp6nK6WwjKOCfp+ITJQ3qi9JpqERjhh2jDt/inhRrQu6L2js3tsbmUi/uNggrXQB6c3J4TwotC5yvJ2TSVxqQo/D3h5c+8vZzoLAjTCyH+6Rs1HUNIkndexzoj8Vt9XaQQJf2+hODeHrNDRROZUcsVbA716MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bT3Tm9vh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bT3Tm9vh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-290a3a4c7ecso6391735ad.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Oct 2025 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761209510; x=1761814310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lia0EGpI9PV6Wa7Mt+zwkxVNwILAbw34cO4vX/DEgGU=;
        b=bT3Tm9vh5bJlWhjWrwRefGdFeG2Sk8sa0FpMd3AcRbUJ5ohYNtYWaz+rx4DUprkZeL
         OmN3B+S3ALQ/0QYjTUS5GF2aEe8kBm5ThYgCaoUp8fCsw23Ci86FcWwG0TZi8T2BsTRt
         89708rDLOBvt256sq8GIn4J8UJXby1AFGIEHv8yJd2NgcW0Y1j2JTNUq67wcDu/MOGkc
         zGzXJ0gn6JRTnwe/QJ/oquoR0Crkrp8acI3hILkU7Q5+KxkxtX+sPOa/O806leyC1ems
         VkZerpuadZcRUVRby5rJ+UCWv3abj9NGo+dkQIv8QzjqS0hx/+dU2XE3+go13OYiSEHP
         ohIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761209510; x=1761814310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lia0EGpI9PV6Wa7Mt+zwkxVNwILAbw34cO4vX/DEgGU=;
        b=dbFjlSV/nW+rd6TD33jT/qy4NgmT0+P3+Fo+kq9ynIVMNkt1fzU0a9L4oCmQI/sZG5
         oN475g7/oMFK3dQwIDC8eJ9siwRjK2bh8Pu/ksOJT/1CVj9MIcQkhvlctyPQfB+1sfDe
         4dzjbw/InzEiMD6V3R0pCqwvuaBLTP+/YeGNvstadiwg5Zxps8eB+JmC9iM6evDaDrEX
         7NrzQmYgCum5EO0RdMVtrGDARtlreOAr+U6cXyEHX01Ouy8PurdDl+cNxX0cJ3mAluV8
         kbp2mZ3ZQSm13oRIi97jfA+CCb1HxgfD4fmaosVdzg71awwZ4DTOa19GZu8XO1ZvVTEb
         kccg==
X-Forwarded-Encrypted: i=1; AJvYcCXSk9kNmIuJ1u68BNd0c0LKUu6m20CaWuoRTGBd3oXcRy2Teih8SMSNdM2r5aVRRmZFgxFck6KoSL1uWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy53APdpo9XGlClSXAHp379vGjvySaLarF9yi5ol8XQDSdJtayN
	0cw+5TTU18RlCQ9iDLvyhnDB4NGCRin6UnGRW5QWvJr+PJkrTZPNIYByQDM6DoR/i8Vle7jN0e/
	V4I2GVBRPiKHrFXJNvNh5D+K0vBnrCVI=
X-Gm-Gg: ASbGnctCdOb3k/0BueWPDf2pCDDXH8m3/Sm1qOQVLRgXsUq+NYbu8oA5beS076VWU2E
	XXz8p3Dp0Xoi0VQkSZ/D+kHlO7zDnHKef/AFFg7RazuY5oTruLHtukx9bFPnbphb9Q2pJV/8x3L
	CYFqVf/oEyo0Gn1KRziEXeJLRLasDOfnmf9YtWVLauDCy1sueudEBeCbtz7eO/i2kK6KonhTC9X
	wrYnn9mt9Lz4k+UVtO7pXkv0RRu7zqj3pHTtXTJXdPoJMoxHi8BYgz9wZwy0T8idn5FchaottKA
	ApqQI8tO76+hXw==
X-Google-Smtp-Source: AGHT+IGVhcbDEMKuw//0lICyRubANBw5BQL/FcN59AYvKRLUM4Q47l9Dc82sfAc3l7GBs+Aq9SlV2iNwhGdQYMKgAJA=
X-Received: by 2002:a17:903:2b0c:b0:27e:f06b:ae31 with SMTP id
 d9443c01a7336-290cba52787mr296045245ad.61.1761209509923; Thu, 23 Oct 2025
 01:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023064538.368850-1-shengjiu.wang@nxp.com>
 <20251023064538.368850-3-shengjiu.wang@nxp.com> <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
 <CAA+D8AP4t+vS_n=VvRR5YYYrp0DGdWvqSN+4U0ZWMaGHmmt9ug@mail.gmail.com>
In-Reply-To: <CAA+D8AP4t+vS_n=VvRR5YYYrp0DGdWvqSN+4U0ZWMaGHmmt9ug@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 23 Oct 2025 11:54:08 +0300
X-Gm-Features: AS18NWBXVYcg4iSh2cxYMtB5rD3rArP78fbSE0SD0ku2-r_FGbA2hH__QJQSJT8
Message-ID: <CAEnQRZBiUu+45Kwe8dy=NsVULj3j=+zmgUEtg1SjZyP8KBpjTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_micfil: correct the endian format for DSD
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 10:52=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
>
> On Thu, Oct 23, 2025 at 3:10=E2=80=AFPM Daniel Baluta <daniel.baluta@gmai=
l.com> wrote:
> >
> > oldest - > most significant bit.
>
> 'oldest' is from the time perspective, which is aligned with the descript=
ion in
> https://github.com/alsa-project/alsa-lib/blob/master/src/pcm/pcm.c#L2050

Make sense. Thanks Shengjiu for the explanation.

Then this is fine:
> > Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

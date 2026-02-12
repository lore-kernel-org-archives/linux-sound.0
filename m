Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A727B340
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 19:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770924546; cv=none; b=D88wwBdqgqQLxWgo/dDNlqS3klD2StxDG7xWG7gCl0Xksw3uZmv0O5uzQKGs2r/J4tWunxTSNtsF7eUj1pc10I65DzNTZiCUi3vXYSynRtJoTCSIIEUbgtr7mtXM0ZKaNBTbyDQ5iNl2omC7cA5V72rg8eWeDJmBe6i225GP3bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770924546; c=relaxed/simple;
	bh=sAg4JJxPhRMZlcOM9VSY6d5f30cp84hCTUI60/6j3to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yzf/Uqg9qpdHkzKRkkB4Fa+SwdcNNBJBFfaLeClWxhe7J9P7AgSliNHuuXvVLgpcK8FwhuMga42sy58R/hUNcdYlU8cjZSTOj0LXPIMoaQDmgYadWorLXGSxdW3YOFWx5HNDvOhFFvyemKPRedfnaqKvERILB9Uhmr+d3z+jVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GIIAIwyt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIIAIwyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770924543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tpmdqUL6Zd03MtYaEYPxPaTAVcaU5nwAzktbzI4ThWo=;
	b=GIIAIwytjwMOIJOI6EqFc4fShjf1C5QTtGOdAvJrCX9/2x6cN1FLx6ubO0B5RgSAsLjmfu
	I3Bq0+9+bpsEM8O72pshmHBwPG1IOCE58WnkEAfdfMisr/PGNA6X64XTwv4XLm74/2jb8G
	oGaKTuYpLlTJbkJGPLi7YO1z+ZKXwNs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-37sknMkgOQaKG8xfGQfw4A-1; Thu, 12 Feb 2026 14:29:02 -0500
X-MC-Unique: 37sknMkgOQaKG8xfGQfw4A-1
X-Mimecast-MFC-AGG-ID: 37sknMkgOQaKG8xfGQfw4A_1770924541
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b8f9d02f64aso8918566b.2
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 11:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770924541; x=1771529341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tpmdqUL6Zd03MtYaEYPxPaTAVcaU5nwAzktbzI4ThWo=;
        b=hpN3kdET5cyQVuyI564azU8EnBqYYzUmiVcRSIanSQjOcqtHgwjaDzL1QaIsHRPMQT
         BHuIgI0uCm6raNdxurrnv0YHgEugUmOJMgnI3e64YleN0/mJOOyG7FZE6F6gjUX/A9eB
         Vkhhe0JpnOIpKZdwL8n+eRb8aJdxJFPvuTC382YBLEa4QayIELX5eE+6kzd1Npag1Hme
         AgCqjOty2rZLt3uWG+kDiqsvQkRIXGqQPB5uaP2xyP9csRvP1Z9OP5p/Ym+TA2r3SGiA
         K2gKDPDp9I8z3+LaX6VzHzcwwN+Dz/D3Ujk3BW3tQZIYaysRToJRgjtFrZLwQ3Py79ON
         Kvjg==
X-Forwarded-Encrypted: i=1; AJvYcCWhF3BlwSbzEE0sTivLUKQVSr1Zda6tWr9rzGBvozFlOoyIV3M4sAZYtnTbdTc2aFqQhpqt9ChfoYtODQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFWRecwg0MOYpOdGSp/bxpFnQ2OGScmkzk6kDQL7E9p/qhD2I
	0XOwkmDsGS6HbDePmxcTZQs5FIHc0AnuK4z9Pt6scEmw/Et+j9r1LulIxuO0VkNop/NThfbGpIl
	Ar3fhwcAkaHlXaWqI3AVRcMdMntvz/kLNh/mlOEjzqNRnYygNof/oxm9gaWutGd9GlSZaia9Gsq
	w8A4vqvrZg1UUMQumE+C2dxJAt7W1SLLQfPUtqxpw=
X-Gm-Gg: AZuq6aLfzqAV3gj6c3vAG4l5CJS8pUgjUbzCLtpqt9HN+7uGqqQeR5sm61cctb7/vrY
	TETBXh5D3nlbBhGepoNy/cSbg/ApYRS5zkSYWM9n6AV99ZkYvgUwNuPZSxCx5RYG+7Du//9u0PK
	UEiy/65WDyY9tsa//SIjRiLZTZhtYoEoAll8gbgfVYc9lK+jhrUIJtN47BlBAKZ+zYUPXYjQi0c
	uc74XD8boRXNMcPj82QuPK7c4bovKpLvaeRYZTV
X-Received: by 2002:a17:907:1caa:b0:b73:8639:334a with SMTP id a640c23a62f3a-b8facd23dacmr7574966b.13.1770924540672;
        Thu, 12 Feb 2026 11:29:00 -0800 (PST)
X-Received: by 2002:a17:907:1caa:b0:b73:8639:334a with SMTP id
 a640c23a62f3a-b8facd23dacmr7572466b.13.1770924540160; Thu, 12 Feb 2026
 11:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212191416.3723397-1-tim.bird@sony.com>
In-Reply-To: <20260212191416.3723397-1-tim.bird@sony.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Thu, 12 Feb 2026 14:28:49 -0500
X-Gm-Features: AZwV_QjQvO5XXNDgtPgNyXwrSbBbUrBJx70WoHrZQUfU0NluC3aDIxA6B0BR9No
Message-ID: <CAC1cPGzabh8d0MQ52d4iPfWdVG731Js8JmdPhu_dMOx9kOt5Ew@mail.gmail.com>
Subject: Re: [PATCH] sound: drivers: opl4: Add SPDX id lines to files
To: Tim Bird <tim.bird@sony.com>
Cc: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de, tglx@kernel.org, 
	gregkh@linuxfoundation.org, linux-spdx@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lOWj11fr0TxkX461LStckFErJdRGS3O5TRWA_igl4LA_1770924541
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 2:14=E2=80=AFPM Tim Bird <tim.bird@sony.com> wrote:
>
> Add a license file to reflect variants of BSD licenses, with the
> first variant being a BSD-3-Clause license modified to
> remove clause 2 (attribution on binary formats).

> diff --git a/LICENSES/deprecated/BSD-variants b/LICENSES/deprecated/BSD-v=
ariants
> new file mode 100644
> index 000000000000..83f24d68fb87
> --- /dev/null
> +++ b/LICENSES/deprecated/BSD-variants
> @@ -0,0 +1,32 @@
> +Valid-License-Identifier: LicenseRef-BSD-variant1
> +
> +Description:
> +Here is the "no-binary-attribution" variant of a BSD license, numbered
> +here as variant1.  It is a standard BSD-3-Clause license, with the
> +condition removed for attribution required in binary formats.
> +
> +License-Text:
> +
> +Copyright (c) <year> <owner> . All rights reserved.
> +
> +Redistribution and use in source and binary forms, with or without
> +modification, are permitted provided that the following conditions are m=
et:
> +
> + - Redistributions of source code must retain the above copyright notice=
,
> +   this list of conditions and the following disclaimer,
> +   without modification.
> +
> + - The name of the author may not be used to endorse or promote products
> +   derived from this software without specific prior written permission.
> +
> +THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
> +ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPO=
SE
> +ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE F=
OR
> +ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
> +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
> +OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> +HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRI=
CT
> +LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WA=
Y
> +OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
> +SUCH DAMAGE.

As far as I can tell this does not match an existing SPDX identifier,
though it seems to be pretty close to `BSD-Source Code`
https://spdx.org/licenses/BSD-Source-Code.html .
Might be worthwhile for someone to open an issue in
github.com/spdx/license-list-XML to add it.

Richard


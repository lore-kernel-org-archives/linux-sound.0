Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC15C262FC7
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 01:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771377165; cv=none; b=EPx/czufEuRmL0GkZCs0j12Tbx7bwn/rClqQIuyYhH4IuZVBANt5mTcu69tqLidqjeqN+3Zzlb4JyWDfpB4CspSGEl7JbDuGd90KOI06IHTHVflPHSSFdZkGqwCtmBV2pXc0RKOVhiVD1cIYFLiPh9AciP6cjs1+LPzSeDm2QUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771377165; c=relaxed/simple;
	bh=2/6vnElhFrBMnyNYKWLXLKU54Zm/8kX+Xau9y2z9qXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Of2ifh84gPM/o+B9mxOIBLc9qKA1FQdjW1iHNwTxPIHh3AlreB7lvPsr1Z3gy0DWoYKDUtHzA6HP72JL/HAm6ChR/zjMCK+jdpAoMcSYNyLoNOIN+Bu8Yof5kmoLYG5n2ouMYjkN6KFStWi2PPatp6THL8EjSWLrvMpAfK2B7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJAUrjxn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJAUrjxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771377162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PZbzwYgsLJmlKwCzennHjdXKgLuFMtkyl2c4ktzit0A=;
	b=iJAUrjxnnqeNG83jazMHWFfB2q1jAztqzBMiQSVM0wYIno386zzja9iCdeS+siA8iP0lWu
	QCPaWKVRJHALtIi4JPtlaCArr9yEj0NoQuhP6UnTyh7F/6mzlWZwoSyxqibwYUZDr/qwqu
	pJOa20PJXzL3fjPMZ9uwYm3Wtax/Vtg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-MCOlw9K7MHSvRQNcQWCOWw-1; Tue, 17 Feb 2026 20:12:40 -0500
X-MC-Unique: MCOlw9K7MHSvRQNcQWCOWw-1
X-Mimecast-MFC-AGG-ID: MCOlw9K7MHSvRQNcQWCOWw_1771377159
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-65b26363923so5453430a12.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 17:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771377159; x=1771981959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZbzwYgsLJmlKwCzennHjdXKgLuFMtkyl2c4ktzit0A=;
        b=kp6kxBOqxftSFzcB820fXcu6JEDkHSPM/U2yBiKQ9wEIydx00UXMHf/nJrdBZE+45Q
         mCPeBY7g4pZyf0jV1KYCHFCXry0EvHDhaBzMcabXNo5KNm2BjlgNudWUoa3ORoTbwwsS
         z+jDPhrVDyAUeiotUs9yzOVaLTmDFsCEiMnZnLdn7en8edZSLznfnc54h6uFsKpSGoHe
         gB3cHelgjOpfb0+f5CfBleMWJGrW4IldJGYFwJHcw5RxDFIVc1mC8Euhn+TDbZ2HC1ui
         PLbM/76DOC1WttwfYjSeqnn5NApZStKQaWWfw65675ejQRPZ8aAuA8Faaz55DhEprPLN
         LbTA==
X-Forwarded-Encrypted: i=1; AJvYcCWGrtH+uqpoXyt2GhAYuZVgTthaQJvaQK1YxOEAHCUWa/Jmbt/DG8Yk9ZQ+9m2wfq9ITirflAdd9G1sAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVHLbtpFsJ0zW7IC7SUvQ+NCdUAILBRnLLHj1a0LIrgqI/NFq2
	NgOXQrMxhlRH6p4iKt/O23zUooiuvRTO1cdiSqeOFp2agpn0Sw7GrcUUqF/eqUf+CZoHt8ehi+r
	TzavJbfCDK870sI9JQMGjeBCE1daspDxq3zhIX/1GkM7oM1YeLXGhsk8k/2gZXvWSkjvhuhDz5A
	xO9Fk2T+nmk/lDWnS0kNO3q7eok69p1yR3IQstxYg=
X-Gm-Gg: AZuq6aIx6LwUXqCrllwIZBk8tIZDTCmkIc+jM3gCmkZsgYYm1UsX3EFUXs+6l2iEoNC
	oB9g/Nfy4BXquHLtLOIuzq0He140k5naGNb8SxDsq/HHx/D2tQN2/qpFwmbfVTsquLg5gXw23Gb
	oBgnCM65By2I4dIWPjYCHMiZY8cWLbwpb3NSZ3YY6qzlZ5rC06hJbWczdK/rMPP+uzF12NhEa0U
	qj4PkiF2eq+rc4zFIylRvBlF94BfTdx6Gk2P9Bh
X-Received: by 2002:a05:6402:3554:b0:65c:63f0:aac with SMTP id 4fb4d7f45d1cf-65c76a5735bmr169092a12.20.1771377159150;
        Tue, 17 Feb 2026 17:12:39 -0800 (PST)
X-Received: by 2002:a05:6402:3554:b0:65c:63f0:aac with SMTP id
 4fb4d7f45d1cf-65c76a5735bmr169087a12.20.1771377158737; Tue, 17 Feb 2026
 17:12:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217232230.241142-1-tim.bird@sony.com>
In-Reply-To: <20260217232230.241142-1-tim.bird@sony.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Tue, 17 Feb 2026 20:12:27 -0500
X-Gm-Features: AaiRm505Q4uZlA29H2yBbTti9PQtdsmSsbTfRnJbDXQYW4A18ZGe2s9NcRrq-Bg
Message-ID: <CAC1cPGw=rRQufzodjtfA8YQt0+1u_AtcFw1PxM_Ldqkrj_SiBg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: opl4: Add SPDX id lines to files in opl4 driver
To: Tim Bird <tim.bird@sony.com>
Cc: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de, tglx@kernel.org, 
	gregkh@linuxfoundation.org, linux-spdx@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ll_lSmqIP7p1RXnhiJOjccAfRZ6k1sTuRRLNrKIUmfM_1771377159
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 6:23=E2=80=AFPM Tim Bird <tim.bird@sony.com> wrote:
>
> Add a license file for the BSD-Source-Code license variant.
> Add "SPDX-License-Identifier GPL-2.0-or-later OR BSD-Source-Code"
> to files using this license and the 'Alternatively...' language.
> Remove the boilerplate text from the files.

[. . .]
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

This isn't (at least not currently) `BSD-Source-Code`. See:
https://spdx.org/licenses/BSD-Source-Code.html
and https://github.com/spdx/license-list-XML/blob/main/src/BSD-Source-Code.=
xml

Richard


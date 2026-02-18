Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30938270ED7
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 01:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771377301; cv=none; b=iPe6n91wMGHC6BLkEOzhCpZdZ6UWbNQaRZCfVbEn0AjEg2TcT0FosHmKFmhKH+Ri6344LdiDKfniD85ghLOk02nma73MiMcTvqgGqdQ2Hj0txhtsoFq3r0GxPX/9Nmg++Ywy3e7aksoifirGnTaD+/vrfF/caje0rKkXF9IcFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771377301; c=relaxed/simple;
	bh=nsyERDqAJwuSfyctXBcxDmB+WrV8lqImmDHXaSMmocI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPf464fkrvpbYtVQjAuKnX0aOJCyd2J2Q0WaaSR6qrn8P6UxKaRSWtKfWkOQD87Rzd0QQFBc2PVgFVX2yvcLSP2U6T9BR/ODACgrrRffhPLk2V9JYd8qGfg2YyVHbDieaU4B1kGitFypKsuQ9p5129dOvNRZSxqkUnH+aCSQtIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZOPEu2+o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZOPEu2+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771377299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BKlI4RGwzdUf+Olm98fkS0+f2kPpsgsr9R+CwbfJIgg=;
	b=ZOPEu2+oTrpeYcG3WDaFlXlesdUe5JO2X2nx5/F9xsBk12aP+AFMbRqTSOFJYndhvw6ZUD
	8hA8mQUlA64axuKMfFAnetzGMMIfJaOJ326G3+10O8tCH9en9/lVnxKSo5gC5vboP2VNXi
	ydw48/iQJCcZNEAvGvYxVyEZoLjVZ+I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-2h1YFEzSNwa8RbjbCNxgDw-1; Tue, 17 Feb 2026 20:14:57 -0500
X-MC-Unique: 2h1YFEzSNwa8RbjbCNxgDw-1
X-Mimecast-MFC-AGG-ID: 2h1YFEzSNwa8RbjbCNxgDw_1771377297
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-65c1c72ecffso2430952a12.3
        for <linux-sound@vger.kernel.org>; Tue, 17 Feb 2026 17:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771377296; x=1771982096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKlI4RGwzdUf+Olm98fkS0+f2kPpsgsr9R+CwbfJIgg=;
        b=H4e98/YTib23Ux42dBIZ6qBauVwZ/iF6NCqSDjmQncC1BfHT5DhphCchZ5ChlwaEmD
         +Etg/s3lQZb2F9gDBkM/3c4/6B6Iqdt/p9UnqSrLlkP3+H7MvhuldPeP320t3/6D+oca
         C3ddo/GdzDbNnpKskeDl7KmPoQ6/13vwS/cpTfQHVsFc1YzyGu4wBGpMAR1itZPAEgS3
         3VC//yJqlHnwHhIL+4OT/Wn02MfkQWgo+jhSZ2LDhAist34i+d3FcJNwTNqyNsipkYQb
         Jj03HMbnbZFs5+37xutMjMTko+IH0Id8j5FDM/OXyUoE6aXlbBvZ3Iftu6ssjQDPz24h
         YsHg==
X-Forwarded-Encrypted: i=1; AJvYcCWE0WLwWz8SCP5U24ZkINDOLa3xWPDaI0m57jYHfi/2Zm8EjI81ZyMLBbrd+SOoPw5wd3EoJmbtRoTf3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMbfH9Nccoff3QTPdGoR1xblRWiEZdi3bJtdV1cRtCrdwPB0wQ
	R6hZYVuMa53SShL8B73qf/hnO6F3JcMREmAimk/QKSWq/SQECwLK3O4RMOF7NXlS+5yp6ba2cKM
	uKv/4W4Nxa3RGaxa4lKxAXXXXalq4zB4Bi4qWedqTjMObonOFSqTC9FSPtiXbRekbEwaw0rbG3k
	OYtzC1EEsWN1jSoN74eWjWH9AwbC75JCIZwN99j0o=
X-Gm-Gg: AZuq6aIlKYAAB2FXdSfg6DUthRwkJLytousgFvQ5JZGCG2ov53xLwMnDyJoEpRnUjrs
	1VNvN9AZFMy7YZtJRuPC18BytOTKWSxgeewrtfsPGbHEMlmsCviMdH9I8N/1vhz9jLxybgXgzMg
	KLHPJbV/UvpDM2NNRNoz7oXmTiqZiG3CKcOE05gwXdnSx+fVQPntD4MQNzWszMt/NJS0KKp4DVX
	0R264hxmQ3k4XOdNfYB9MCOFHQEavDqAfMYpP4m
X-Received: by 2002:a05:6402:2794:b0:65b:f342:d1a2 with SMTP id 4fb4d7f45d1cf-65c76999439mr188465a12.6.1771377296618;
        Tue, 17 Feb 2026 17:14:56 -0800 (PST)
X-Received: by 2002:a05:6402:2794:b0:65b:f342:d1a2 with SMTP id
 4fb4d7f45d1cf-65c76999439mr188457a12.6.1771377296165; Tue, 17 Feb 2026
 17:14:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260217234124.242053-1-tim.bird@sony.com>
In-Reply-To: <20260217234124.242053-1-tim.bird@sony.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Tue, 17 Feb 2026 20:14:45 -0500
X-Gm-Features: AaiRm52r1tlVe-jIo54qSa3qvYxyb85tmPIpuxzB7SMtXwur4Sex-zpO9Ut3HLg
Message-ID: <CAC1cPGy_ZK3=F9ZY6P+YPSuAzEAp3XGewwrQUE1MJ+=3jh18DQ@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add SPDX id to midi.c
To: Tim Bird <tim.bird@sony.com>
Cc: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de, 
	linux-spdx@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RlZupuJ8sESGDMxcvf_DOLu_CA-1SimvI_xp_pMbCzQ_1771377297
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 6:42=E2=80=AFPM Tim Bird <tim.bird@sony.com> wrote:
>
> Add an SPDX-License-Identifier line to sound/usb/midi.c
> Use 'BSD-Source-Code' as part of the OR for the
> license id.
>

> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions
> - * are met:
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions, and the following disclaimer,
> - *    without modification.
> - * 2. The name of the author may not be used to endorse or promote produ=
cts
> - *    derived from this software without specific prior written permissi=
on.
> - *
> - * Alternatively, this software may be distributed and/or modified under=
 the
> - * terms of the GNU General Public License as published by the Free Soft=
ware
> - * Foundation; either version 2 of the License, or (at your option) any =
later
> - * version.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AN=
D
> - * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PU=
RPOSE
> - * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABL=
E FOR
> - * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIA=
L
> - * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOO=
DS
> - * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
> - * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, S=
TRICT
> - * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY=
 WAY
> - * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY O=
F
> - * SUCH DAMAGE.

This isn't `BSD-Source-Code`.

Richard


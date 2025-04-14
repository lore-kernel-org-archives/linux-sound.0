Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72082580E2
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 08:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619704; cv=none; b=dq2niJz4/RIc4dO21BgzyXtPFBZSy1RnAtSWQAyWozLGrDeccSeGMnwEZeXVJeIdFfkuVnwc65fU6SI1evMTi7tCnclrc4vq9YTLDOKUZnU84BKb7WuoqCrxdrnFLJm5rOfVFwNTjEpPKlZiRQPgcmH2TZFsEeJlts9LzxP90NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619704; c=relaxed/simple;
	bh=10NX8EwLLR2r9DRMLmPVc416rQ8iKku5D9AEAbxLatU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y2b25WR3TvFZnfpbYxbCPKmXosLpK21t4NKQVnD9Z8oRhZ6tP3cOYn5iFUibbfKVQI+puLu5Hc3eeYN/NbEC2HsDPvehtZbzWihZihQoyLP31MYNPX6vMly5Fn5g/z94Veu2ozq77vIt/sBpaYXpuZjmSsAASeHaQ7+cOuXUOPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Row/ptCQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Row/ptCQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744619700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10NX8EwLLR2r9DRMLmPVc416rQ8iKku5D9AEAbxLatU=;
	b=Row/ptCQ6KMaLfNLDRuGJwjLo5NVX2ZipXPN5vPc85O8S3cuJ8nBOGIes8RU5q2DLqdYYh
	9cQ8nIZkRU6IFNjjNIkmB6PjPPfPqa8YYjnFUIg1VeP+HcXg8wcA9wU6A8jT1wsnMuUctB
	81HJHge/r9oJOzWa6FNyRqd58abUXw4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-LEG69jf1MRmyaYxYrnegjQ-1; Mon, 14 Apr 2025 04:34:58 -0400
X-MC-Unique: LEG69jf1MRmyaYxYrnegjQ-1
X-Mimecast-MFC-AGG-ID: LEG69jf1MRmyaYxYrnegjQ_1744619697
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so24381135e9.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 01:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744619697; x=1745224497;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PIOpVQV5D5BRv1xgM0IAwIJtm4jSxhzbncofktJma8s=;
        b=PO7bX3Iw5CY+WxhMFf+MrbvVkgKpYefhMG/JtsNrfnX9hsw2j0f+TYkGWu0AftUe6b
         IDDJL4MmvxN6BYy9jzkIBE0Niy1B1qUJ+TBkWrxYuXh1eBUtz/adjPhcIQhW8emERsOd
         S6EZe5Huj/ODS7D53UW1+9SJQRmOl9JDlHaTwuQ7nB4NYmSdgVUWJ+ybwtmxjDnTUlvk
         udVEJg0awUYwpEnCTvyOCqq5BS+lS8aILzvUc7bmbqV49cMIumrHfkYU2itTtyS27WV4
         G8ZjDrXswe97ILoHKFW86RQ2K9C/O+jqm09EmHBUypbDocy82Uehrywntfpg29YYFNPe
         Ptfg==
X-Forwarded-Encrypted: i=1; AJvYcCVhEMR8Bxv0/Ylye0DqwuGY0rWLeMk3rsav84bQpdoJIpXa/6/mHFWGfTyigVYiTgB7d2S1cWN0vLm/3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YykV+JpiHPld2B08DocxxIB/aXpV7y7mP/J0bQtUuTqXOp0N/vC
	+AUZqLha4kLK9MQxsGbEM8pBqOI5TqUX32lqtL9sDBO1LcAe/6F1S9udSI05HP8GhQPiFxkUgQT
	wu8gJAqUesA0TkOmRmMktHRCDRaSCn6KiMRXUa95VyCuJt0cA0bLrSrq2X9Sn
X-Gm-Gg: ASbGnctpiVxVzaMau2p2/1csXuJX/6Rx2tElbY2JRbQNnKBU/x4qp5Ew9s3rJz97D/B
	AnAQGHoHD0Ja5MIlSA0T6q0AQCLb2yf+BoONs8a/7fknvQzIEJjoLzfzT0gX+Slp6u1BZOhYiUd
	ql0nNPxTky6lnXJiIqgXIikvZX8es+Om0Btqhw1SQgJ+v1FffcOUmC4dRtdfj0q1riHUMDWjPO2
	rNbiRZQvDuc+x40/b1b+dLlfb3Gr9CQholaSklJPVoIM8IEAy9+pi8cHVQHy7/AVMOfJf9TMqKj
	X18J1eiws9NrE3pp3vFgLBEAH7bIz/NkQT6Ckw==
X-Received: by 2002:a05:600c:46d1:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43f3a93d3ebmr93206765e9.9.1744619696950;
        Mon, 14 Apr 2025 01:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE2U5uao+PT6g/WVNEshEebN9+0Vm4AajYz2grDM3hxYYZf433Ix69Xh8i1SCWSRFS+d7XLw==
X-Received: by 2002:a05:600c:46d1:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43f3a93d3ebmr93206485e9.9.1744619696509;
        Mon, 14 Apr 2025 01:34:56 -0700 (PDT)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm10395145f8f.96.2025.04.14.01.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:34:56 -0700 (PDT)
Message-ID: <70bb676764099754d10c4be2f095e0fb829f233a.camel@redhat.com>
Subject: Re: [PATCH v2 5/5] ALSA: korg1212: snd_korg1212_prepare: Rename
 del_timer in comment
From: Philipp Stanner <pstanner@redhat.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: akpm@linux-foundation.org, guanwentao@uniontech.com, 
 linux-kernel@vger.kernel.org, mingo@kernel.org, niecheng1@uniontech.com, 
 tglx@linutronix.de, zhanjun@uniontech.com, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas
 <bhelgaas@google.com>, SOUND <linux-sound@vger.kernel.org>
Date: Mon, 14 Apr 2025 10:34:55 +0200
In-Reply-To: <590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
References: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
	 <590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WmdK2WmnlsupeXo3qrhgF0fh9CKvlI-xtxGSQL_YeMc_1744619697
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-04-14 at 12:26 +0800, WangYuli wrote:
> Commit 8fa7292fee5c ("treewide: Switch/rename to
> timer_delete[_sync]()")
> switched del_timer to timer_delete, but did not modify the comment
> for
> snd_korg1212_prepare(). Now fix it.
>=20
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: SOUND <linux-sound@vger.kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
> =C2=A0sound/pci/korg1212/korg1212.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/pci/korg1212/korg1212.c
> b/sound/pci/korg1212/korg1212.c
> index 49b71082c485..5e69bb25d420 100644
> --- a/sound/pci/korg1212/korg1212.c
> +++ b/sound/pci/korg1212/korg1212.c
> @@ -1553,7 +1553,7 @@ static int snd_korg1212_prepare(struct
> snd_pcm_substream *substream)
> =C2=A0=09=09return -EAGAIN;
> =C2=A0=09=09/*
> =C2=A0=09=09korg1212->sharedBufferPtr->cardCommand =3D 0;
> -=09=09del_timer(&korg1212->timer);
> +=09=09timer_delete(&korg1212->timer);
> =C2=A0=09=09korg1212->stop_pending_cnt =3D 0;
> =C2=A0=09=09*/

Wouldn't it be better to just remove all that? Or at least document
what it is good for?


P.


> =C2=A0=09}


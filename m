Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D72D191C
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 23:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770939279; cv=none; b=kl0eyvoiHRduvnszTbt4rGSSF6YSL6q6Y1Ow/Rvbx8qtAFl1yVlotGQspvGflArNz87FWT4lz1tn/CdB1Elgqc6F8mZhdtov1wYsj+4yy/RmhKMQPlGMTR2X5UHgDMb3zOqJ/xHqAgc3hdnXnjnVam798qBN2OYLNisdlxwUCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770939279; c=relaxed/simple;
	bh=tX03wrpLM+GbsF8Aw1sR/6NtFzkcJJg88yV00e4hwFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=igviwOQxOHkE80Mv2iVQ5n4L5luvjo7EeFqeGFFYeoGjwWI5cYyaXyjYuMIWK6NSQNRisLot1A6ZkTrOa2U4JZmyhh06F6g6iY9ApiB0b6mmK0qDaP+HxXkXFvNJJ4yJCrxWwpOLNqLce9Zwn3GFbX/cAO6kfbvl8uw5GKMlX08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gfOjXDtW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gfOjXDtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770939277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tX03wrpLM+GbsF8Aw1sR/6NtFzkcJJg88yV00e4hwFk=;
	b=gfOjXDtWyfeNMcuhbBuc1R4qhXq3SUajmcuLFkueg+m4EFtss5PZ+EHCWZOm8Tk8MTlko9
	v0mjBVzQmATc3EY0NbuJOpyB9uonznqSEL3ffAvwrg3b7jtP3e+wFzkbEnBOvaUej7S4jA
	1jeV6IVVdO2VtxSZSivGOK+P7T4H4hg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-6MqTIkrCO6udALbNNvA2xw-1; Thu, 12 Feb 2026 18:34:33 -0500
X-MC-Unique: 6MqTIkrCO6udALbNNvA2xw-1
X-Mimecast-MFC-AGG-ID: 6MqTIkrCO6udALbNNvA2xw_1770939273
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b8fa57213c7so19375666b.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 15:34:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770939272; x=1771544072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tX03wrpLM+GbsF8Aw1sR/6NtFzkcJJg88yV00e4hwFk=;
        b=ux7KAkgpyjfrCi0Wn4lhLTsMWKiLeYX9o/3vk2S1THxxxdIiJPkd10QtVwO6K4tTOV
         baPFOtbEk7AOLIU4/xkvy93YgrhOm59NkcT4NKy277lo7q6uE8dkX7G6p6V+Xp4o5Eez
         +YCI7cxROUlcRoaoiOaqyeWKFsq7wXJciwr1VWY3DkYFJyzAKqYxYFxdWdezDyP5+RwM
         hadAy0xrTo6CDcVXxdsWijhdDpbPbR6VJVLTC5Kos6YEBnjSvBgCc4lXn+KfW0u0vaLq
         AVi5x1JsfTlHZeI3C9s4B7HDHuD2+s9aN9RVwaivI46X+X9OobfKl+Dz3Ma/P2Arb4g/
         nGKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN6Uv7PRrlE4yFhRVDnvfzogOCNc7NpGkKNo+h5pHOvzDlcQmduadxzxKMJJQFD9ikeFaEMBEn9I5ICg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsB0/KJYtAUh9dj1unyOqW82RCyc6z0vK+HfNwFwMx76qsBqDc
	WqlvRfQ6rYeq64qq6xFRIzm5D21E3ct3GGsp6EuMAHSY9a8ln7NxSlLH08NCaajbetQiHNPdq/U
	6p+RWKbgnM0rVC6Umx8akn6rxyM+e+tZts7CSdK6sMKqzWvi/zQKBZUXbZYo7hCboTUDjtoVKBy
	jgGRN2VNR8NwJCIHb7YC9lKSbLluHGo+0w339n16s=
X-Gm-Gg: AZuq6aLA3z7ln83VX2QYSvh4SeQbXozsnth4+rt5eDCQHPHXdJ66zsgSIzWqBjbTUHI
	km5nI0KSHiDj6MQ6PQ0Gxe0XHG7/h6YymNIYf1DaYmsnRoFbAic/LJQrdMTh7XkJYdlLTjMc9yL
	CiCg1brHj1x//L2P3oGB4Bm4eNzpr8m7sxR4NXfJ59iAQDKrq66andFqouMFusEgGDqwAyfl8rt
	zC9h4CSH4vmEzHYPe36QriOsuIab0f034C0Jfyj
X-Received: by 2002:a17:907:7b8d:b0:b7a:18ba:a63 with SMTP id a640c23a62f3a-b8facca6457mr30822566b.19.1770939272614;
        Thu, 12 Feb 2026 15:34:32 -0800 (PST)
X-Received: by 2002:a17:907:7b8d:b0:b7a:18ba:a63 with SMTP id
 a640c23a62f3a-b8facca6457mr30821766b.19.1770939272241; Thu, 12 Feb 2026
 15:34:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212191416.3723397-1-tim.bird@sony.com> <CAC1cPGzabh8d0MQ52d4iPfWdVG731Js8JmdPhu_dMOx9kOt5Ew@mail.gmail.com>
 <MW5PR13MB563268BC53570D4C8D3ABAE6FD60A@MW5PR13MB5632.namprd13.prod.outlook.com>
 <CAC1cPGyh140A=0cwCWVecCOqQFLHttXkpi554pjFVBb7+6J21w@mail.gmail.com>
In-Reply-To: <CAC1cPGyh140A=0cwCWVecCOqQFLHttXkpi554pjFVBb7+6J21w@mail.gmail.com>
From: Richard Fontana <rfontana@redhat.com>
Date: Thu, 12 Feb 2026 18:34:21 -0500
X-Gm-Features: AZwV_QjewXFpHFEPqJVDyF8fX8EaH5fBCUKxmvC7w0eZlsaZ9dZCc4BtMbCC0WI
Message-ID: <CAC1cPGxJjJ-ay5GPnkuuVJ2ruvz_1An3rV+VgCEHL6G996Tgrg@mail.gmail.com>
Subject: Re: [PATCH] sound: drivers: opl4: Add SPDX id lines to files
To: "Bird, Tim" <Tim.Bird@sony.com>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>, 
	"clemens@ladisch.de" <clemens@ladisch.de>, "tglx@kernel.org" <tglx@kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kate Stewart <kstewart@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4_YqCgvfyMcFqPCkczq9cJfSvqOd6bxh5ws-AbEhAsE_1770939273
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 6:24=E2=80=AFPM Richard Fontana <rfontana@redhat.co=
m> wrote:
>

> I submitted: https://github.com/spdx/license-list-XML/issues/2940

Oops I submitted that before seeing that you'd done
https://github.com/spdx/license-list-XML/issues/2939


Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE0E1C07D1
	for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003402; cv=none; b=qj/lWiHsBCoZTcb6g/pFnb1+6qk5GSxlI3d5lMSbiw0bGose53GFdIDl2BSJ3p9B90OUp6cyDhxFA9xmW6CVcAxxLhcnojhG+zCP+gPSrNU3JefwqqBNC9J3HqmDFTKlgp/p3mSgbVQWUmZBWA7W8PH8ohbVD1tQqVdOjoR44xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003402; c=relaxed/simple;
	bh=3zG8ijviAh3UNaecnSyBL0gw5syOhcN7O0Z2Z+3aryo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/Nr4Yb9IbFLEc9zirYKzhAXQ8CGdboWOLPSBCT/Cs6DqL0VWiyVZ17J8pE/5IkrfLDJrKfNdrWPn7gBBtc0rYReHCEj9EuN5yzP48IyI99H9JxMTKvoBdiaMP5TyZQs2y2OBcelsRis9bKmpTP6aUvc89q7HN4KGTBSzrMi594=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DR785tQf; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DR785tQf"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6cbe53a68b5so34765076d6.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Oct 2024 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729003399; x=1729608199; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xi1uocso5/NdgZpE7t6HMxVGnFAWW+NbbBS6pPLwquk=;
        b=DR785tQfGwJEWbg4OHMkXh+e3KqPMsKYSWF4NAJhBif9uuZzCU/sMGSV7OAk++JUbG
         By17IuVFTxzvztpnRHsT160/tZYcFdARE+JT3cqmZrKEeBnlU2qLuGl7yFPeQPWqqEK5
         IANNA6frJFsFOtz6GoGFtzqIRIzghzEiENCIVlpgjCL7Xt3fzNm7kihTwhxIcjJahRNL
         0Yj/aI7wj+EAeA/GwE4j0JjNAtEz740G2E3rPV0nq/mCSeeqiOWpKs324p40T10QyYcS
         W8Aj9npm4f0NmIxhWtoq1Kgf0NJTa0Tths4+WvddLf/FKYd7qTqtTgbMoS8OO1PARvqz
         tsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729003399; x=1729608199;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xi1uocso5/NdgZpE7t6HMxVGnFAWW+NbbBS6pPLwquk=;
        b=Z3vx24AhCKqcIwK8Xd1lSpfky/6SMKd8+vu2qmL4C2/cp9glSS5/eYVY6sO6u59hhc
         se7/L3EWKWX/RahvBlUWncLgu/1KAufV9uAAPujuwViklV8lEY1fqCKMuLOgykNF2R8l
         p3jb0l2Vx2kGtKIyNsAthf1thM+JnNVY69RkEz+4VqJ3qPvohekBaY/0rwvw1iZKeCSH
         D814Hnjrjja60gMY9oRlpxjc6zgxgVOyAqf7MkUcfk5dCELu7eMDcDLhOUSCGt/330tP
         SWxbydJHFD73+ozfpMRvYPJAOf8pIPdqBctSLrh3sUdA9///QNOVce3+bkKPaMJeNsNc
         hM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUP50fM0UPwTbTUW7VpI7Gm45XXGv4iGC9296wSBpqH6SYuuOIfmrqlUY3oKekvghhaUJzRVCZoqFz6LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3R/ui/eaSUz6Y3HrmvmgBP8YHsHrNa0CLXOkcSuHFzayEMohk
	HcnOnOCNNGIs09hCSmSohrhqkuRNmtGWaceeqBWj9eaT3/sz+FoMm9XTztB3Ow==
X-Google-Smtp-Source: AGHT+IHlwqwj2zLwxFP+7TNul9Pxh1d5Xd7nG3ml8Ey1XcTIoXlwe4sCsZV0vRFmkVLRCXSSsyvq1Q==
X-Received: by 2002:a05:6214:5d11:b0:6cb:e76b:d90 with SMTP id 6a1803df08f44-6cbf0044b74mr186884986d6.13.1729003399548;
        Tue, 15 Oct 2024 07:43:19 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22961b92sm7297386d6.120.2024.10.15.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 07:43:18 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:43:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	mathias.nyman@intel.com, yajun.deng@linux.dev,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com,
	niko.mauno@vaisala.com, andreyknvl@gmail.com,
	christophe.jaillet@wanadoo.fr, tj@kernel.org,
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com,
	ricardo@marliere.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	badhri@google.com, albertccwang@google.com, quic_wcheng@quicinc.com,
	pumahsu@google.com
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system
 sleep
Message-ID: <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com>
 <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
 <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com>

On Tue, Oct 15, 2024 at 11:56:00AM +0800, Guan-Yu Lin wrote:
> On Mon, Oct 14, 2024 at 11:56 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > I'm not so sure about this.  By returning early, you prevent the drivers
> > bound to this device from suspending.  But they can't operate properly
> > when the system is in a low-power mode.  Won't that cause problems?
> >
> > Maybe this really belongs in usb_suspend_device(), and its counterpart
> > belongs in usb_resume_device().
> >
> 
> To my understanding, after the system is suspended, the USB driver
> will do nothing as the main processor has been suspended. May I check
> what forms of low power mode and operation we are discussing here?

S3 suspend.  You are right that the driver will do nothing while the
CPU is suspended.  But what about the times before and after that,
while the suspend and resume procedures are underway?  The driver
needs to be told to cancel any ongoing transfers while the system
suspends and then restart them while the system resumes.

> usb_suspend_device() did close the required port/bus to maintain usb
> transfer.

I don't know what you mean by that.

>  However, there are additional usb_hcd_flush_endpoint() calls
> aside from usb_suspend_device(). Maybe we should consider not doing
> those also since some of the endpoints are now handled by the
> sideband.

Those calls should not be skipped.  If the sideband controller wants
to handle the endpoints on its own, it can go right ahead.  The main
controller and the USB core need to know that they shouldn't use the
endpoint while the system is suspending.

Alan Stern

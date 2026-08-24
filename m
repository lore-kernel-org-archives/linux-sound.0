Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC552C1586
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584524; cv=none; b=DqXxe49f/DLyTAvUBK8l/KiWUhtph62Gl9pleu4s4ZKbyqUGk0i/hZxYbY1jowhvDD5M4OBo28yGD4CYj4wHsqsPCLrhjmu/3CNso1bwiLIkUoALnhcVWX+J7ElgdhWojQTQrPFkXLffBEjoZzkBcGGbayxGcwDgSa5FBrnG7J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584524; c=relaxed/simple;
	bh=qK1GwUEcsGrPCSm9TsEBc8oiljPcoxu8605ddv2YQNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Olt9DaEUj5lf1zRYW2lrkJEWAd0kUq2xyA5RuUKNZV8bZMaArsnRy3v2AMW3nqc7ND0HG0VkvGcU89h4S5pJzfaSQceY1jjtVQKq9+MpgHbd7VIx5ZJH7l57Zi85ObarG/NSzyEBQXU2P17CRVNsYQprWXROEYZ2PhtBDA4evuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=feDqex4g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="feDqex4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
	b=feDqex4gBOFyvNSebYcq7ztBQRLUj4mna6M8/RD9IAvjxZDAEX67vWAqAjSb8PrdLPQrsO
	mcEkaSlTy1KmnArP1ARYfR07IuFS2DwHzZtqFUASN0WYD1qDSgAdZlK/gctHeJjv0LJqMG
	5xAFJb+asq+pAz78Dl5MTkdzv+iYQYM=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-DoVVz0XeOSukTyX9YLWJYg-1; Mon, 24 Aug 2026 11:15:18 -0400
X-MC-Unique: DoVVz0XeOSukTyX9YLWJYg-1
X-Mimecast-MFC-AGG-ID: DoVVz0XeOSukTyX9YLWJYg_1787584517
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e538afe65so471871285a.3
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 08:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584517; x=1788189317;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hQ/sSTFs5xLRC8XTkDORGtcjc0aCfdkhYo3Pbbm9UI=;
        b=aO4slZNpiiVKAhP+DG/phos9m9+NVzYoerUz0ygnpBbQvemSsgM6AUvWFz0z4jrWlP
         hNezOy1J+rE3cXfr3WiDUUjYZTb7LQ6wC21OSVqh20IBmFrk+1rknBcbeymeK5iORKTM
         a9/QJ2JWtDYncdyaD0HN2w9leoLy2p+fyf/dFAjdn/Y/1WfVBI5ZStPmJvaZbfLSqfPm
         P2xAoWlRexZTAuTM7SQECy60mQ2i2Ehi8Y8czWaXak+D1wpfOPNq6vua3x4/PMg8z0Ln
         Spm1Dlln2OYvVqFPMm3vkyX5WrU7EL4VkXr9Z5OUdXdpS1PD+wDyJ+GJvlxJF2Q7tJRT
         O4EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUDbY40UugPq2zSMFuiC/jPUmWuKA1m5S5MbDJQVi4GBdZ7vppahIcGpzAw3SMmxdNXUBru3fBEX+pEw==@vger.kernel.org
X-Gm-Message-State: AFuF++m7vNbO8uBaMOv52M7RbvgSFkdpkANIo2BOVWcFgwCjtqR4R/Rb
	OTeWplLP8b23DqL/FhEuC5x79PE7JabjO/kXQs1RqDL3rMzJPEyK6R1s6+b9ldJsAbebqE3EWb+
	qcs4LMsao2KVrjHxBi9Ibw7OiRVVVMMQaMLVrJx+iDxOicTL17GMcmlaivSo8pPSq
X-Gm-Gg: AR+sD12RmpCCKriYOHMGhv82U52mY8LqRu0Aku/UG3riDSbiXMr60FaeYvAXxJuTdbm
	wJW7s9MhSOgdHpW1wkSO6KWcBgY/urG5zYV22ooIB5mHK2bMW3+BRl5IG+VU8k2Dj4CqIb6InGA
	hGufzxJe/aFbH7jSA4WSsWdj6YCAZl45aQWTPWWjY+a1FvHfhfDwx3eYjeKPtPXLxHRAWhEj9Bw
	My4qxXYS1maSkzOb6v/5w20uamvlCjYcZeQ76q4B7LYzAtES6zPP+E1xF5Ye+Z3LAeZAz4Mvwc0
	i8+CSA5tu3NnS9YcGbKqxZKyxnd4YpNarPPLrjnTA7riOue/2XeLc7d0JL9VXyexl0eOozQ/lUb
	RJTf74iKSAknsj8yXuVkmq6hQyJmtRQlMbiY=
X-Received: by 2002:a05:620a:a28b:20b0:936:9f47:e908 with SMTP id af79cd13be357-937394a1bcdmr1968165785a.19.1787584517486;
        Mon, 24 Aug 2026 08:15:17 -0700 (PDT)
X-Received: by 2002:a05:620a:a28b:20b0:936:9f47:e908 with SMTP id af79cd13be357-937394a1bcdmr1968158285a.19.1787584517040;
        Mon, 24 Aug 2026 08:15:17 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749abec47sm517147585a.1.2026.08.24.08.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:15:16 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:15:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: codecs: wcd934x: Make sure clk_init_data is
 fully initialized
Message-ID: <aoxgA4ty6zhxEwIZ@redhat.com>
References: <cover.1787239902.git.geert+renesas@glider.be>
 <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <560811bcde4b8459b5e96c131e50a94ee75664fd.1787239902.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OrAufTQ_1-e7yIFKRt7IqUHodOZ04Q_KHt_HGI-ZSvA_1787584517
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 10:52:56AM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


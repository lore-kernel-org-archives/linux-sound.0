Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D08174E
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708530785; cv=none; b=u1weTyOM9NJsec1Nhsk7NATjmWLsxy3XVyyzUZ6fNyOLayMjPu2T8VA8FfiwlkH5qd6K7h+ZL6L496Jz3O8JwMzNNi5AY3j2ml5Ano7xsuM8e3RZKP/eRcw19qofTrZ/l7ZovI5SsY+4Jj/3GR8E6378mCrmXkTkpg9rHrOWlXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708530785; c=relaxed/simple;
	bh=9VgNrg7E3WxzPLbpdW7b+fQZzMzEpRyOCT/6WT2Sf4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzdUUKzcSU/QtOUqAazee86C6TQ6J2xi+hrzYz3UU3QQkfHewbrH7yGklB0P/S6rADK0nEDYsamF2+lM7TZH4+mCUlBTFyJReSojt12XlMp+tZuJoMaDGiXUhf5yJniAAB5BdLFdi1AgHvzTusHITrWAv26SWrh9XyKtWF37YG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KPVNGf/J; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KPVNGf/J"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-59fb0b5b47eso1958576eaf.3
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 07:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708530783; x=1709135583; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9VgNrg7E3WxzPLbpdW7b+fQZzMzEpRyOCT/6WT2Sf4Y=;
        b=KPVNGf/JFzGtwRewRMQg5bShOJa0Dgvza0OeCoUI1GWDo3nuIs/PNoWjuu8dwSGmAf
         SZPCubx3OIjthO+2MmVHtovqUtncme4JxvyCFCCOmhxRsa6LoP9T/D5mw9loiBQBUzeo
         HdjFsS431y7wY1GXtpOUY9cN0BW3QNQF26OSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708530783; x=1709135583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VgNrg7E3WxzPLbpdW7b+fQZzMzEpRyOCT/6WT2Sf4Y=;
        b=W3B6+hBmQ4sRlfJrLm5+jkE9lnZSNnXpNRgiHzw2Ukn5aTMPaXpcfHwtbcJC+rtPLG
         2Kf3tRFS9sNUyHTG+30ljNeHjYrLFvtRxgzIE/wuIapMnVeBJKdNxmLUOUCV+ajsI+Zx
         sjLjqMMa4RnuXTuC/Ldtmbr5j3syOWyp7SJ1SW10JoPE81JkQZdb8QcpyBTOJ+lIH/Vy
         iP7v2oDx1O2+BvOptLPSprRP8lF0EiArFKWGhXvjPwq4LpfwXVxRsbAjlDvisOcKhT5n
         Mw052DXYfmVQusHYa9ISGZXgRYKpjDP0RgkszSmO8mK6d0sfzYGjXGGRgROTaJmBd1Wd
         UguQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJQyqJS+jfnoIkE3PJbcdzwPlDVPxxDXETnht/5GJKyrTVVa9g7clNaIG45rgqmwCMr29OKPNsia4nM4N2BZp5LdF305ZtlYtjOZs=
X-Gm-Message-State: AOJu0YysOe8ks5bkDjTj0GzX1xHf0E8iKH+pLHZNZ0zkG35Khk/vjGyO
	uZgBxCouPM+T00RaJZj7EeQVhEN8Uo00a/gZiOXdFm5bPRcXc7q6GHx/a66wGo1HBqrwWHnAq+r
	mWZqWGGijA3WDzk/mVif3KMHFsiz+ZACWRRe3
X-Google-Smtp-Source: AGHT+IHQpFoZXWJNF9xVniu1c31fdFShm2fJtfOtAD0LYOdmrGGoF9j9d5Fv7SW7EM5r/4boF5/8ahxD5g+W+hfI9X4=
X-Received: by 2002:a4a:355a:0:b0:59f:fc30:d3aa with SMTP id
 w26-20020a4a355a000000b0059ffc30d3aamr5366824oog.3.1708530782898; Wed, 21 Feb
 2024 07:53:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG-rBihs_xMKb3wrMO1+-+p4fowP9oy1pa_OTkfxBzPUVOZF+g@mail.gmail.com>
 <20240221114357.13655-2-vbabka@suse.cz>
In-Reply-To: <20240221114357.13655-2-vbabka@suse.cz>
From: Sven van Ashbrook <svenva@chromium.org>
Date: Wed, 21 Feb 2024 10:52:52 -0500
Message-ID: <CAG-rBihOr+aAZhO4D2VBwSx-EGg_gbgBYKN3fSBTPKCXdz9AqA@mail.gmail.com>
Subject: Re: [PATCH] mm, vmscan: prevent infinite loop for costly GFP_NOIO |
 __GFP_RETRY_MAYFAIL allocations
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, bgeffon@google.com, 
	cujomalainey@chromium.org, kramasub@chromium.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-sound@vger.kernel.org, 
	perex@perex.cz, stable@vger.kernel.org, tiwai@suse.com, tiwai@suse.de, 
	Michal Hocko <mhocko@kernel.org>, Mel Gorman <mgorman@techsingularity.net>
Content-Type: text/plain; charset="UTF-8"

Thanks so much ! We will stress test this on our side.

We do this by exhausting memory and triggering many suspend/resume
cycles. This reliably reproduces the problem (before this patch).

Of course, as we all know, absence of evidence (no more stalls in stress tests)
does not equal evidence of absence (stalls are gone in all code paths).

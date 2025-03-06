Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DACC148FF5
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741276086; cv=none; b=X4xcMeVJOJDLmLsWSm7QCjxqKx3eW4gG47EnAuBqk6XwVpOKZ9k1d9wE+JKJnTnA/NF3JoSbed1x/1bicUF/5lUTRwH2aOAfK3r2W3KUE9QQmO2Gb0plc/63WR7IOaLJ8B8HoV6mUh0Hp16M7p2zpHIZf3C/lX577jzlq7dT76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741276086; c=relaxed/simple;
	bh=hacApDz3bgdEjYb5qCsUz0pzc3ebhQH3NLHTHcQZAiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AVwcehiPz/9Dm5XO7ZR9c0UNgG32AWT4cLjE5Dh0lGDlDsKIid4kOmTEV3e8XN02zhBV0tGRtSfz1ihjnkVC6KaSi791uO5E5YNZEdsHs6T18uv0/Uw2IGawZrVzpoY5nilAKf0TtgkG0QZp72OcitXN60yemvAxdHVf20DJoao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OR+ho8vk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OR+ho8vk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-223785beedfso14510245ad.1
        for <linux-sound@vger.kernel.org>; Thu, 06 Mar 2025 07:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1741276083; x=1741880883; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/OI6qWkzSL42ENObYHFHYvCUsETCfZznWv+xdQF4mt4=;
        b=OR+ho8vk8YVYXsk0/CYaabw1OJZFpMqCw0lFn8oByoEDM6p09JJDDtw6yt3cEJcfCH
         eiR8r4K6QyW+F/A1TFzIpO/k52muQgwKN39xYmEOWI+dmMtWufPZhVBFF8Qh9frvphYw
         9TehZ5ofuBPXa4Lu6fKbPCVYS+Qlr5r/3LmhO8hYplgLJVUjaYMNd7ECSBJ7CqGeVS5i
         zgZ0rRAmJg9n6Uoj7eMafnmw15IL6sJ2UAO51Zt9kkN2G4El2qqRezNAZtO/4e1gkMqF
         Musy5zS++f35I6iV6pVg5ZdD1QgMGXdc82xKxQVQefeG2mPGNttMLnz/LzFC7HD2eY5Z
         dlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276083; x=1741880883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OI6qWkzSL42ENObYHFHYvCUsETCfZznWv+xdQF4mt4=;
        b=DlYHhmbrZDAzoGTWnjv2XlOXPoplJ3/gCdKw75bS9szIGFZAVKLtuArutE7T1mPDMj
         P+SFLbYkp6hUmkSvH1uJysn+i0ASKICqW/1ygP5lS0fm1adB+GS159OKVzZBZLj/buyX
         4j4Oxu6rjMyPUFLJXIrY0FnGOMucRGN9Y+cCN2ryhGUvHtlIcxpHJA992C9A81fYitDV
         PdsrA0qZ0y+llhoro4nIpOiLge1SvuZWWS5kDXvXXJadsSISe9XKXFgWCK43F2bj1cxE
         eD24rHJRpNp8mYesFWrbubKHrFUUFtYtIJAW+xYHQgRdJ5AnfB0QmPwMm7eDiIWQwLIN
         xSyA==
X-Forwarded-Encrypted: i=1; AJvYcCU4z40iXi6deDqmJqObBZjp9Q75mDzLfobyU6ZxLGPUykYuFtIl4ruaIXXDAcWtYEDYrT5Kyj0VxLjWyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcpmnmOHjq0Xo0ERfGytgxShMhm6ych3BK+FsVRwIdjIzRVcGT
	71SkrKkC0UIRhLu7vXj7JBOT6xL2Q1JdOoQhNnTGNRzhIUR+ucUtTXLcNQMRB05/mcjMCZkSfxn
	aIMdwFLR01DbDKYW5Rf7M1xvShohQgt7UigI+Wg==
X-Gm-Gg: ASbGnct+EaHpDEqkNfWwr8LQ3wtXzvq2ek2h3DhvElr+BJNNEDsFsSXvzEZxmSahLP1
	KoRKF5Z7eFt8kaODtZBCGWeV7d87rKoMUhpimOuwdoghvmlFAcjN1Rwe/v1nYwLX42Ofl2ct6yq
	vyrKc75a2h1vn+X11Y55VqmiuGFoo5hKzIEAvmUu3CF0+swS/xE8VDxPutPg==
X-Google-Smtp-Source: AGHT+IHdH9LY7zK/Q0pWZb9VOvETaJ79jmjeJJTfURtSwN6QJfJvhZaPVX/aXAeMTzGfATxm32kbiX1wlMowGWPYNJg=
X-Received: by 2002:a05:6a00:2d9a:b0:736:4ebd:e5a with SMTP id
 d2e1a72fcca58-73682cfa781mr11104081b3a.20.1741276083262; Thu, 06 Mar 2025
 07:48:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304193912.5696-1-wahrenst@gmx.net> <20250304193912.5696-3-wahrenst@gmx.net>
 <20250306-delectable-quixotic-polecat-ecd2c3@houat>
In-Reply-To: <20250306-delectable-quixotic-polecat-ecd2c3@houat>
From: David Turner <david.turner@raspberrypi.com>
Date: Thu, 6 Mar 2025 15:47:27 +0000
X-Gm-Features: AQ5f1Jqspy5s7bBncwIT9FkLCyjrZ2w8bgfIcgASFwW7Hu0kjHYkImdZGmJ3bSw
Message-ID: <CACXvZi-NT1e8YXJEmcHyf29eSr5NSL2fdLXfQb5amCf_YFL16A@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] drm/vc4: hdmi: Add jack detection to HDMI audio driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	kernel-list@raspberrypi.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Thu, 6 Mar 2025 at 13:39, Maxime Ripard <mripard@kernel.org> wrote:
> It looks fairly generic to me. Is there any reason you didn't put it in
> the HDMI audio helpers?

I originally wrote the downstream patch last year on 6.6, before the
generic HDMI audio code existed.

I just had a look at doing this.  At the moment drm_hdmi_audio_helper
doesn't manage the snd_soc_card (needed to setup the jack) at all,
that still lives in vc4_hdmi_audio, so I can't see an easy way to move
this over without a lot more reorganising.

David

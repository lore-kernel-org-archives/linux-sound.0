Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853799;
	b=upSXpaVCz7Nc5uWfa+e9C/K+u8yNkSuIrfQH6lRRQB3sBBi7gWc0RyYq37ZUdZ6cGCaO
	 PPcxGR4r/pMdFrLnJvTVedIm1lWBALFC4IjU2WGkgi531nMQNO9RKXzvpmRwjCPR2KSCB
	 0yF+MP3QqOZkclLi0VkRxwMGFSalZVtMbn/X2fBMeQQ6AfmUqVi/XMn8UsMTbDkDWbQ9S
	 RDQKCgM9XQ/hlr2KkhuOVaGToPYy/nz8B6FgpLqX8xXWtXAs8+TBfgfiz/fztECtoVZCv
	 wvaRruCjWFjGrAE+AXe+/SXxNruqafXWm3rVCHf60qAtvriqWTPoUUfs3cjhb/djLQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=bHLWkFfiY839RRMvY0sRGtkwoSwGP1yi5cequXNnj5Y9TJjyavdjDAwyU2ItUqCafwdX
	 /XuBv+y8zFUVOjilagUG/DxED38403fXTxTwY3tkZKAk9zBRwhlHN5EyLpK85r+dTVSFS
	 N0gLE8cTYxITOuFOa/k4+0F5RCCDj8s8u/M+ryTGLewQ8w2KU4F1J/+pwuzhPEpnovd+u
	 U0gaj/RSCs0yO3Sip7vXj2Xt2G4zVJUDRLuXiugvDccZw8bSm3nHz0OeqJpIp05QyMWI6
	 40BZCw6Piyv8uUGsdRY11wYsgDKDVstwpsHm3VcTX7NmqRnUTNA/4bSw91vhj+Qt+vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulv1stUt;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAA2606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAAA2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ulv1stUt
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b546061d58so20736363c88.1
        for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 00:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795853798; x=1796458598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=ulv1stUtqpRQtsCqjEdHlIZAi7l3/dvdBPm4zrW3i/KDRbOi1q+/HP7TpeWpckp9Jp
         NVPZ2ibQmUFlRtNnSEgBgQ10SGfVPGFaAikxdh54UDoUcKz60vOwghLJbAlQkEd0HBxt
         iLrG5/GMKoK6dvHNy3EBI8dhgd5THdmoO6cyQ4FcZ74EKAbsT08d7LSDPaUx4MJNrNkH
         S8WqBZ8hmXsVqtsmH6VTBtWtEK/MzH3hKlEZ/fOnkPGJhWFvWgZujjE7ToKZq9L6nG93
         YEXN49Unr7fDKBXgCDIcZ07vDcM0YgOHFotd63hshtol6pthIxXEwCTC82xgkpyBHW+U
         FJTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853798; x=1796458598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=v+In/54VBkRwhDau8HAg73Jr2Kj5LGVWA4oJdTYQ4tlozsLT6n89YgtdNIm71hDkI2
         F5HbSkWcmKlqZk1mDVCn74J9bfPqDb22QsHYttkCE4xuCpNpXfKsEYO9KiW5QUOwG/u1
         0fC7DGsKnY4c1YxHoqRzCZIwwT75y0nZydW/VonqRDG7kILs+Pqx/bjwrlO2wDyY1OXU
         ZmelypllnXNZ4bL8K2l9Gt2WboMQcEn+ksOqygjJl6q+pJ1lG92jGumsWLYZfQ1dbBMu
         I9iSa/WCu7Q91maWI9pv6kkcL6t3qlaJthVcnA87k047xXYgIUNc7eszv8U4hIH35ZzK
         0hYA==
X-Forwarded-Encrypted: i=1; AL+hErEEb/gnk2n6aG5xdkLnY+ODIbDgC+4L4u2ggGVTZZFiu+WrSZ1euluP22MspgxnjbrRStoBaeRBhXjOcQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z89gbQe/3jfnIoctMyjxti6+RvKIUuzLFqlnSP9acsFdAfAwE5W
	hzqhZwQu0MSSxDimUrHRfELqkFtFPiQ1WSzVmHjhhtTyv317sElJAvQH
X-Gm-Gg: AZFdTZddZ6V+jhvX6r63sIbWfL6PO3vIQmueGw5j5VgHGEBjT/jVnvkfD1HJHgUEJEl
	giLh5GceXig0/PcRAIRvAGMRyDSRqtFYyuFlxlGfZFbONTgwmpn30nz76dCfCysDkqD50kL4kFN
	rM8ECZjh/kYLMDUoKGtixF0xdXGyOhNFFXLBDhyE30e3N4ncWrBQaHz54BMcs6jRic7URHst1Cu
	cmHY3gZKwt+sqqtXG9WBoOWBkzMFvqtNj//DCUTpl37BCZRHZCMsp3yv1nLTgjaYPG5wHdYKmIH
	MvTtFIIwAYnEe1o+iNZWoBdFAS+tfKjlGVbx9zo4n3ZD5tzpJsgCWRPQXARe5dvalIgjCMRnJ7S
	WvytBxrXHVZyitT0Z/eC8sVeSkEyJIrS5quo571g7kebxFLNXVIWsXYX0KYnLbBvWL12NbU6tzy
	9hPO24fHd7kMFc+J3uscTgIhZDcXsJ/cz3S1FTZpgf52bNm9S1ZMCwuWMWcWWvbNqXirJ/8Ox4Q
	kROWW05KCgMz9UUt4SqFcAp9Gs+OfjPUtlmItW/MWHJvVnOASH7b9Pgq+cN4uK7FaKzKTnRmHyN
	0sy7X5jzzKpXxuCKyj1s2VoJgNOYqrFltG8f+y/TtEyG8pN4IGs4
X-Received: by 2002:a05:7022:ea46:20b0:1b5:23c0:4f15 with SMTP id a92af1059eb24-1b556918196mr25488342c88.39.1795853797765;
        Sat, 28 Nov 2026 00:16:37 -0800 (PST)
Received: from localhost.localdomain ([103.179.230.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm60323430c88.3.2026.11.28.00.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:16:37 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH] ALSA: vmaster: Check follower callback errors
Date: Sat, 28 Nov 2026 08:16:13 +0000
Message-ID: <20261128081613.3067-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h5h2mba6.wl-tiwai@suse.de>
References: <87h5h2mba6.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj

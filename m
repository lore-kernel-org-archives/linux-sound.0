Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100710;
	b=SdQuAphpMXhOAF+pmG1J9kwrQWz2ZWHKt0HEo0191F6SE0YeABAYk4iUTaJt4Bonid19
	 Yp1brEZKhuFvPvzXZYWVbj2GIjz/4THSjkzS9k8sxIEHNNEjk8+E63ixgIxFEZfDbSFFG
	 +9jSdeHCkQjFzwV1GG3scVBstEfZ3mRAqn12od1vA3bV9lZZbiGJLhSawWEMg+jdyqon2
	 3csAHEhwwFrI3TvxCR57gUCLsWfJeSIBNeWeVOqIDrqON+/brIufiVLjA0ORwRXD/ftfz
	 9WkKXt30Ey/5eiRilO20Fc33GJDhnwK4yLTuAJ0zSESYbUhACOVPWiclyy6oZrbRdZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=k8Gd3f1MwjX3PaP6A0sILYsnnLQj620DjMYAfCG38Ue+tdqI5d9Kt7MdQZpOAgP5cLZf
	 axq1Q/hy7148+vvVtWRjn1stuxnfhtVGdZ1iIBGNNGsBVUlBNvUPhhOOP+QGWF5xrXDi9
	 6sqxMJ4LiGJbfwSY0Fjw1Neqr3x96oKLwylg6nyfMSo+lDkNG64BjnYNaym76NLsgrPY2
	 NknUw4w/EY2G49U77Fb7m9qc5ax+IJaCdV7KZyoqFKJRHpSmozdgy3aH66amnB0eFrW4k
	 Ma1leEJQZDX5Fw1RianRtFZ0T4ZceIFtjCvL3fiLzN+mWqYgre6ZswBAj17tD+C3xvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T26g570z;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8D2606A320
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 15:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA8D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T26g570z
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso1104692a91.0
        for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 07:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795100709; x=1795705509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=T26g570zTinVZ32+RY0hZuPnc9DFGHMCCsp8slET78BAeohDFBGqYkf3hvE8Eo9h8V
         Usaw6nVtlrk+d3oamQ1jcFyA9giN32jRODjY9X7eS1NTAaTcBnxZcVHt+tN5fbYjzIHy
         r5OR8hY1powy/U9qlyyyf71OiqKVgM2a3+nDmQ556ZX17KyAbPEmf1MMZb8E2M9gFH18
         Iw4/7t2RvjzlBpnZ9vo7qGesWW7Je8Fj83C1Bm/t40JB7ytkGvE09pU/J4L/L9y5UVcg
         9blWa5mRNyrChqzdd5jlEXBpEvyMwmnkI9DXrXhFq83fID1Qq+hDuVkiI5QWvSIGG6Ty
         e8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100709; x=1795705509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=2GAwILuXbCEEQME049/sQF59hNvQ6rsMLkVREkDrwgRN/FwwVxyo8i0AvofSz7HuBM
         9fVW7dsG7Ug1HwiC7FmpUzqmZ0DI9lW90dIxRr8HKf/pBbSYOv4CPblgUk5uzztD6Zai
         K0v1g1rvbOwY1bSNt+mtlJJE7AJ4e+8TvECT9yFNdyKlwWAyzyShkswRSKRfBagTxEzG
         8SHRhSh63cLn2s7PqGkOLVQaNE9DjVFSWr1g+pWHGBQ8vo3pVRyadaVcdXV9lIQlnQea
         uIwCCe51biuQcJoolH7NEaldkYJpVIjFZT7zvPtZgDl3/0mO0pzs95ha/lmypod2tWUt
         ZhQg==
X-Forwarded-Encrypted: i=1; AL+hErHyCro7xi0BrzGCCESRVM7tuGXWrEYYSee6cRxfbactdWHnQRbN1WkP/Yr2ilSwcMZc2In+YY5TVRmoPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z85ZJD+UxlnunotBcrIjXIrNLEc7qDEBRck8jjgrq5JqfrVAiSA
	+CSZkoOYqOjESkiga1DP5GlLwSHtHHH3ZcjXdWYSKkd7lAQileUrlDJX
X-Gm-Gg: AZFdTZeduSzJy9YHHvrBym3edKdIHOLEA0hP+TaHO/faskQrhrf49Z7OOzEQ4jQhwtp
	YoY3NjPC+mWsies+GZiBJun870glax7WI4U7zVzXCSbTbANFgtGG9UpDO4S9fn4sr7LpgBVnQF4
	NbTlNQhDOywWGUrNsVYuatrGrJYLyqBVAt8bjGvG+5IoNE6gBorVQk/nqY6sl0GanPY9Y7EEwdS
	YoKC3/qSNluhVto3Np33BzgCaJ2H7w1TNjC5NHvpYGKefMzVLTOwPz0eZo/hRSJHy+CtTft/hqJ
	FenrpwlKp4zBRwLEfxSRU5FXnduU0F/rd5EB5X0DdRAT6JsNP5wNSVBOu3O8n685Vd91G7KhBFH
	e5eOUB7xUPKzHhioaCUU2Nb4p5ekKKViybegaBHwEIdXAekNpSgMdGKLK9b72Yc00GYvhPYUn3Z
	ZkIJpbRcG9SAjN3TflKb/7W2CYaQT+5iM7f4KBpZ2KEVJIwDGq4KEM5enhIwEn8Gy55hSoHKP/4
	Gqu3Pj8NnXHxJlsIZvUPuXYoYYE88k7L6eIcEFktKfdkMZtdpVg6p9zetJhufhsM+3KjaP1qXlX
	eHrRNm2+UWF30joPq5BF7uzn5iJalTjEBcOi7HJZsbfyH3PhlTWTtQ==
X-Received: by 2002:a17:90b:5407:b0:3b3:b0f4:1bf6 with SMTP id 98e67ed59e1d1-3b3d074d82bmr5995161a91.22.1795100709124;
        Thu, 19 Nov 2026 07:05:09 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4028310c5sm1827475a91.3.2026.11.19.07.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:05:08 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: lars@metafoo.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: dmaengine: Check DMA submission errors
Date: Thu, 19 Nov 2026 15:04:37 +0000
Message-ID: <20261119150437.3380-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87se0xugic.wl-tiwai@suse.de>
References: <87se0xugic.wl-tiwai@suse.de>
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

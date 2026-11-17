Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931339;
	b=D0HyVA9N+DcvK7drIzBDDdMcSwvHBOA2N4dnenoQAKEW8OoZnz/yMC4m/ESnwVPBoTAq
	 d5P9vGRjSk0JlOvE/hX7Z1ySJ7tYmWzn7Xl5LCoXjEaLHv+4zAjm9v2A1tCAoNQfJMPe9
	 8o6c9X9wG0EVUgZ70rHOrTknPV+kZBZNFcHKLsEiOWr3ka3vT+hL/ZkYNXX9uL9i0tkq2
	 h7oD3/V3JJ1Qzy2NjmhUhP3D84uXUsYMonHvXI0J2vtNlkFYRw7NdNR5sEREsUB7vpTaC
	 rj8PD5uwU4ipUt/ExUVhMymC6O1EXsTCTwWQiTtNfiH5xC048oa8NsEg42bHwxMMUiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PEKvPMWHlgFXON+uH+oJ0xpBSRB+nK6bJ4V9GV4qlLE=;
	b=n6evMrcQH+16ElIGJugavkcfTc3jzqmSUVRntp4iFGpeabUMuDCU+WY/uqDnNDvVhKnm
	 Bs5249IqAVPEtD6u5OeSMpoDzMdLfKgwsoPfkaNeUpIZM7jU/mvWnvfbMGGE1C56IQura
	 gOIeJr77siplcOTuFQcXG/2yi3/d9kOfI5FykTq1dfnWB+Cr9AYezrD6f+hDaPdzuAzJU
	 9k/ZCqATwMc49Vkp6DugwyzOSkbTu1nPrN38bRM1Yz7s9QTk1rsFATZWQJIHM3zmfR4RL
	 CaThJ4nZT2o9bH9cSnrbkI9V90j0p7zag5Y8YnOZUUpKnDQ7Z0uwHP0xbIXto0mHCYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+qz8ZXE;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4FE606A32A
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 16:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4FE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W+qz8ZXE
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-372bdb942dbso4528302eec.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 08:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794931338; x=1795536138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEKvPMWHlgFXON+uH+oJ0xpBSRB+nK6bJ4V9GV4qlLE=;
        b=W+qz8ZXEWvqJWZvwzsHqa4QTgmwJcYChmAwrpxXaE6VI7ZwPjsV0HSiEN3HRry4Ox8
         hDV7fG8SvYTY6lnJvCXFFLN9taD+sYrVjHFxvyBxR5BAoMfKHuDJsIR1pYslG02f64/p
         FUO27/X0phz3jd/frZYrJUErOAeKsUfDRkb8ZmrzB5S+1WE9sd4VJzSYzERG24Ftp04d
         BKipFJ/afKe6eeSg09hpNgxMoKLEzt8VlzvZHDj0H2fUBNisRfgzmNm7jFrl+h434rTb
         a5SHuRkJkn+2Eb0m2Y31Uxpbf0h5d1Kg5OXcc1+e1ENctqe7vTcsaglUdP/nQDpodNqF
         mtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931338; x=1795536138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEKvPMWHlgFXON+uH+oJ0xpBSRB+nK6bJ4V9GV4qlLE=;
        b=g1j/8ozXpYlGrkEPtHhR7varvgA9CCBEyAZcBRuFoZ1q4Um34jgtdVujMZ3wZNIrV5
         qRykwHh0nIpOnuDam4XCNiYA0nB256nuqkZI5QsM3TTSF5WbdKPZeR3qTbHx+pkZ7qU4
         GkZutjoqO9sQpki4QpvFBQ4hkw6rbPxzbBebY5DhNAsvqZLG8aOLGu13bcmA45P3cO4q
         LNPV28dQN/bjk+aaj66HP8CUfIhD5lri4W1OrpS1YsWrkO1DlrFkJtDOsEJHJx2yqGAh
         NsGjRbpOnCfLcYi0oAUZGidHuu8dVFwqdziEYYrO7p5ps0KKZSqt1zdf3eYuYwvsLsjP
         rtpA==
X-Forwarded-Encrypted: i=1; AL+hErGgG35mMNRD6A+pJIYfIaP+Ix7P7ppi9Wf8MnLd3EXw54JUciqD2RiJmfd58Qva4pddkg4VxlXz3pqhaA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/euFxL3Wl9JoTSaqvXnaLTKcbxNWmmLW3udsAQ4xEYiJmae9mV
	I0lsZZvzthWeK6cvtI2Tb2pX96qvjNamXCfwkTSPxUmAeeCezbXQs/XA
X-Gm-Gg: AZFdTZetkpg45n70byUVOJ0DDq7UWEj/klboBtVmVlD9FNbSU5eRzZqEg1TbYgK242Q
	4B1qO/LItjUDoXtEFXtM8AhIN7CM7gzazsPNRr/VCF41isZdmW6W4t6GNymZsi/tJE6rRReQ7Uy
	/rZP1POTg7zrWIeO8VdBTu/YgxTDKNpn1O1+cF69hIqKBOWdT5JjXZ0SGVVSHs9aL0+zy1Y/Nvl
	Y3B1DOQKipMyP8Z0sLBqB1cKVZIW8Hw00N0SB7Ukz4KZUuypJaSXp/9QbqMCfZ7T0gsN7kMlCEp
	p/zGWQHh2PEKMXSZvNqo+r7DUd9F1cYU9vIxFq87hT6Y4aOa1xQTiIQ01puOxAsUbUEywl3ZJXi
	hTHNKhNsR62839jQfFki4fIIsN7WjunZRTrqt1ZjWM4qjifBuZhbNvHq/V9PJYCtO+fkNePt0T6
	kmW6d9MVDaiul7xhoPFLdCzuQR5+qAqRQrqf4bd80HrxjRoyXi1QMgH7jkDijc1tNK3nh7jRoRd
	7vFTH0RsJGJUZk+1M51svTQFIBd9iWteVihUU1HLRQzGcyXj+gEUvIQLTzBncjGEK9xZ3jFcZOX
	G0SOkIbE3ztDggUTYdqXCXijSPMEhjK+Y72O+Pidf91Yzt7j4Fqz
X-Received: by 2002:a05:693c:83cf:20b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-379684b1ba3mr17121353eec.27.1794931338166;
        Tue, 17 Nov 2026 08:02:18 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3826fc797a3sm71414eec.22.2026.11.17.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:02:17 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v2] ALSA: compress: Fix task resource leak on copy_to_user() failure
Date: Tue, 17 Nov 2026 16:01:51 +0000
Message-ID: <20261117160151.2624-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzgjxzh7.wl-tiwai@suse.de>
References: <87qzgjxzh7.wl-tiwai@suse.de>
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

Hi Takashi,

Thanks for reviewing.

Regarding dma_buf_put(), get_dma_buf() takes an extra reference 
for each DMA-BUF. This reference is intended to be transferred 
to the file descriptor through fd_install(). If copy_to_user() 
fails before fd_install(), these extra references must be 
released separately.

snd_compr_task_free_one() releases the task's original DMA-BUF 
references through snd_compr_task_free(). So both the explicit 
dma_buf_put() calls and snd_compr_task_free_one() are needed.

Regarding the file descriptor ordering, I moved fd_install() 
after copy_to_user() so that the file descriptors are installed 
only after the task information is successfully copied to userspace.

There is a small time gap between copying the descriptor numbers and 
installing the file descriptors. Userspace should use these descriptors 
only after the ioctl completes.

Please let me know if you have any further concerns.

Best regards,
Sreeraj

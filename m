Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131464;
	b=xbBTIDud/QUr/Z2FTuSCKB3Te+Y4ezVEllmdjsLmo56z7SP9O732hVnsG3vB+mMLl72J
	 l2TM/laMtZdL+6gKsRgbXnxJy96EDL1kwwZUZiS9gp2ZtToCdZXBE+cYjGms0ubEvtD9L
	 Onu4Vw9XLZVUk3PM3KvzqTw+Sm7O8wC0Wepu9Zbv1PhmxVp2+C6we88ggoIAkwkQGIgqQ
	 Smx7E056IcmjxPGq1RCGTTdE35GvfCakvUMEHAbLcw11DqvsCLRZ0XbvJk57PB70iQpyX
	 4017zORxmhdS45ThXOcDyQ0zb9hqZ5WiBJV9ys1GWv7EXhZbqVGXqfcdC+u7ha999uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
	b=1Z3sUvvXSCfJxX89F6kfOsIyXTWHeU03igDp4+koe3xIQ0sFfjady1LiObjIslqB/u+W
	 bW8LycGD/PokyMXr15vb+q6iONi7hygvOA+bUWbZiyifn0EnsWggzRLZKLO5qsRfC8Jg/
	 LWArOB7p//CcGCqHsKkZ/6aKE3kHzdNLYuVG6Nl1KW+0BM89vaVN2mgTwJLHdTHeOKFQn
	 xusuNjzjv/g1khghKcVZ8VRPO6B29zlp0kO6k7ujbILi7yFzoo2TRh34FcRqvCV2kj5fw
	 zeKVN+d3w58gSVD59zU42rHMr/upHJ5mIzO9utWFSh9g9lOrF2B7XL0rGMk3aAOGV8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9MbatcP;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF7606A320
	for <linux-sound@vger.kernel.org>; Sun,  8 Nov 2026 09:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DF7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=z9MbatcP
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b1ce85287aso14024c88.0
        for <linux-sound@vger.kernel.org>; Sun, 08 Nov 2026 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794131463; x=1794736263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=z9MbatcPEUcQAq0qGZ3/s/lLzdadDxz0rHSeJTJAirBCt4/efSuPpRDBKz64qjvgy6
         hg9nAhwx9kXVEaKTEyafH6oAt5VAlQg9p7+j5r702RJXagJOxR9Ond2oSnqQpBgQ/J+/
         jfoF04bCfOhY0OfLmZ2a2leXB+oRcGrwGJYAw17hP9qvysOeyGDZIa8kba4mLbDkcXzp
         XVRBXQW0DBmY01Q9lnJrYgTg/tgybZ1WWtScTQ4CUtR/3h+74tixBOZzKGca3KkZcsD5
         c9k9p8X2ZY5kR35o72CCSjH142ql/yvekLGvmNzXvvtcSvc1wjdte15utVMB05GoDo4H
         fxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794131463; x=1794736263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJGPA+72p7Wv7RqTYja7FID1pyjvxUvI2bULs8oG6rw=;
        b=W1o5bCI7DdFzY40OCoE7lS6Gqs5eTMUYDnc0t0ct9x6vO7DStWoZU+33lmLxeU6z3X
         zvd34IYcWViNZsVQcUyfHpnC2WSK5XW3vEA5S9TVQD5VmDu/nMPXhDy3DL40QSdyfrLV
         Cxc4P6QiuIJ93NndnwpWbCfwhQ+0mcrMS3ZoDbfm1+unkaZ94DzvnijFTeYNnVScYkAG
         EqajzV+X9iTNAnUkIeqJOsBJPYIIBN/XxUeIT4n0wsLwGo2zd26BmHqc/iXqLyIqObHP
         RKHA7BwwM5xbWJQ/GJ22nJQfHHm1oHkNLwfBBuCJScoV23NC8sRMsxxLAODlDeB7Kx9V
         SWSw==
X-Forwarded-Encrypted: i=1; AL+hErG6qGmOEHN664dGuU3+Gm90wpqnyNa8XBo9O1yPFAY83CdPfdaNupYrRIO2S+EQ/vYVRGI6vQVSUIFM1A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZMRARnNcG3XyoPuo4tSJKJmBTpNZEeQufMfVqu0eHFC03qKME
	oH1OkemFXMMHo2B+jgYPe2A/GOsdDR+DwTzysUseeFili0txYfuExcuN
X-Gm-Gg: AYBFou3DnPZ40CNau2z4ZQ6+N8QieI57JUQpNqHFZCvHkOwYvQ+pqYaMPTlGhEWriga
	t4dxGwwwa2j8cQKx0KMKI9aad2b8XDtQDx4QtEG3V2O7J+6IueZs+1SG4nAT4AnJ74pgMqjY8EI
	yW+7BVghzU26DnCfL60tHxB5yhw4D/hwjwSKTk0qn08xemNHjfEmTRk5rlxWgykldOahE+5SztB
	Tt8aRBjAL8PsX0x/AptM1lI+4hby9PyCGRIu/pZj9d7fUBOKb5IvkywA23x+EVcqbb+a9bBpFod
	J4baxKmoBv3PcRc/icTUFN0sqmqzT1GPdjMg32UDsAtjlvVzfqyJ+7pAyJhC6kN6wcANb+PLQQt
	0n7Uc1desJpLu+c+9b61N2rN1hyjLmxfE3DTT1egcDhtoQHwgwdAYjpxu434ZqSaZIfdS/CJnsx
	LAUg8Isj4iiNCDBvdLrdbgCrNfj9d8+SW/yMdSFqJ6Dw1GphMtWSGbWPBoWjD0AAxxe4ld0lkHn
	41qjmYDwt7cA7Zkf8DT+ySizsNJwgRMg5WTQ8XMRfzuN0smDHHbQenoL5EVwcJvaF1iICZQw0dV
	6HKE2VbMxZViThPQ3kkBdRcUYROoDrlBvuTSsUM+od843hjKCQRN6Bf57LYfy9b1oAzaAsXj
X-Received: by 2002:a05:701b:2092:10b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b39fea1ad2mr1810961c88.19.1794131463482;
        Sun, 08 Nov 2026 01:51:03 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8911sm5076842c88.5.2026.11.08.01.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 01:51:03 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Synchronize LED mode accesses
Date: Sun,  8 Nov 2026 09:50:36 +0000
Message-ID: <20261108095036.3241-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87mrrkyc7i.wl-tiwai@suse.de>
References: <87mrrkyc7i.wl-tiwai@suse.de>
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

I looked into using simple_strtoul(), but noticed that it is deprecated. 
kstrtoul() does not provide an end pointer either.

Would it be reasonable to retain the delimiter-first approach with 
kstrtouint(), as in v2?

Thanks,
Sreeraj

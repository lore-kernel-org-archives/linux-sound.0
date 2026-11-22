Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362070;
	b=O9EYPdPC1jPYhV8ioOTQ4dnHkOie/tiQHxb/WwS3neb79FS1Aem6niO5xwKdMvaNAbDn
	 UTRhn0r6GQGGnvmoNrJmVXZp4trsDR8FXxM1AkB/vcUIFhcZwsdTTYUXqMj+O4Yo3TnGs
	 vBBDaUHL7yIdmqsyOuOZYpG9Gpiu+vq2zEMouUEP3ADikQnvYKlsjw+0+IZXRutHS7gwd
	 m0q3RxLbDJs9NtYj6cMd7UbB/9n9cbm8X5JDuVjg1WY0Dc2cVUZvyBi/UR2cojgictlbc
	 3KooKe9wWya5PXumSmwvtnYhloxfQCsumEEsx+zeH3VgmYsCf6xUueGQX5pURNVObcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID;
	bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
	b=BQHtDJJ0IGyS4QmLfhJwcirbTbJbrNwwGsQlCGH6uOfJ4eNiQIk18xYsABVYLiZbWIjZ
	 AGZIUOnH0pGMBhZBuor8ZMLNbq2Gfzmj+p6XiNd7gsmMlTq4t3nL2IOgJV9edd2+lEcsD
	 hw/jKS/BcfZtpptQQJ/HJ1O64jafgPQKx4vAJN8UbDMUV0K9MaiIYJYwuu73KBLuC7yZx
	 uF/m1QI59rcExEKM4P2wMOeAW2iD6zWI/TZ7lNHYHkzIEt+ZmuqTRx/slogCSYF5cPIEa
	 c07Ss7iL1X0EkpuxtReWYS+gmVE7nQJPo1a/EXLXtzsgO2f1Fd3XGWenU22p1ojNRYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF7PRWXc;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55AB606A32C
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 15:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D55AB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aF7PRWXc
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso17166545e9.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 07:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795362068; x=1795966868; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
        b=aF7PRWXc0cLKKbQEjH/NWrxHpk0VSt4Mb98W7lWcuTXny9UwbVQjWNgdaTnkALpRnk
         ux/9n6buSQRz5KI+3QLBJxNTc6MUL/3Z8pukSMMvpI70jSCBmFOxhunBAjmFon5OUlw8
         j8OPqHV2y3RIwcRGxnktk5JPhwVLXFh8TlC98YliUQXrUK7di3eUuwqTpBcyymRaglaG
         xyyR8E5UJTiikMyV02fX9tHJ/uBmGGBQyfCCJYTXbaoVH0N1QFVz0kcVXdDY9vlJIm84
         r77wwS/7ZPpbbrad9ITagWEzOdLJGFlIqjHs9bpxtCSxmtc21k6nmUljdxekl0bDq1gH
         HOag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362068; x=1795966868;
        h=message-id:references:in-reply-to:subject:cc:to:from
         :content-transfer-encoding:mime-version:content-type:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0Gj7XdrXAPRpCwdyxefzNs9ruQYDHS6265gpVziOPI=;
        b=YRRQLMQruNQsxC9dG2wSK8vm7SzPVRGo7dxKoMR3OkrnwfzrH5/CY6SAiUIqCUjJfe
         wwqjcrZVvt/xaLOzSl9byZWhh+ukSY50Lkbsc7pXzCGsr87zEXoOqfe6rr1V7k8/Fnt1
         5rWr04+d3pjmy7kWHML/SmnFuCZ1hQ6k3Q9AVVwshIOKOxEE22HvCF6hM/VDDBdbIGsl
         Duy7Od4SUaT5p89Q/jS+ztsV1NHfsq9ishJSH6j4rIBSM6dHOi0BCRZpb9BzHbpq/Tqb
         vH1Iz1C+6I23SVdOuxWE24UXdlzTe3Dc6mGpsUKYNLlTiK3EtxekzIBZWMddKS6JP6N5
         rkuQ==
X-Forwarded-Encrypted: i=1; AL+hErFPH+wABzsq0ePTkRbiL84A/enF3ygcVqPZein1NerqJJubPMq2hMZH1EEXnNpSuPzRSS8kbtDAJ+8F1g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8N1Ug26ENohQ1/r18kMgpFLLhYDiT/ZZLQ0hg0ygwFGKnkUwaH
	2kmGGC3DSOPQsPWQpWr8UoUVzErjhmkaqdN7HKvqUmyw19RnROhMUBpo
X-Gm-Gg: AZFdTZf8JERowp8leNJ0N0yQjY2lCHpfjMeIVzZeHevzjMIlxJSzyqouzuGBVOKWyMd
	mg30hUbDEJzyHusNjURZdjVSOTzhfWknE4L9UkTkyMAw+bSRXGbctT1Mj4kZNBG4tJfS0BV4Q4S
	tOl9BrN4cLA0+H1Ejkj26B92RUhE7ME37FJVgcOL3d4Sn+V06n+UwH12tBcw4daaM37ak6QLg/c
	iJkM1PZKErFm7nd029QwJsACQXwdEfMc+r1GKufAibfztPAib+WjCo6GtykL24mKiRmvQRdRTHE
	v7q8otov7RZNn1/Lf62Ta4qeT2lK4eF0PYTh0RE5I1LOauZhzlkAZuUfYTE9QMg3vwAKIYLrmlR
	GP4TZf5zXsuy72RM62Kpbpa0jqlGQ7FKm3G1auMw9HMREIxYzDNRbeq36FNZYh1ApQbf6ytE0Vu
	4VBkjvFjeY/n4qvXMvC9MLoutKKHh6O0vuyW5DTRcyqXjCappy483eVP1GZ1fMu1/nwhBEZRioe
	CEa/e3UzH4YU1rX3Fh0gMl+Slug5LASW7dw5r43Nbrom532sD+n+IbB
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr201760365e9.35.1795362068140;
        Sun, 22 Nov 2026 07:41:08 -0800 (PST)
Received: from [127.0.1.1] ([196.237.227.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm276634245e9.15.2026.11.22.07.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:41:06 -0800 (PST)
Date: Sun, 22 Nov 2026 07:41:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: vkoul@kernel.org
Cc: srinivas.kandagatla@oss.qualcomm.com, andersson@kernel.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: Re: [PATCH v5 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
In-Reply-To: <c15d3417cda640aebc7bebff76b0448e@gmail.com>
References: <45f11591823b4395aa19dd3a3ee6dc90@gmail.com>
 <954a5e65e7424694ba29836fba08c802@gmail.com>
 <6fc5be59b56e42728e33595d5415441f@gmail.com>
 <c15d3417cda640aebc7bebff76b0448e@gmail.com>
Message-ID: <b9a72d2ad40d4a8087acef99a7bd2fc8@gmail.com>

SGkgVmlub2QsCgpBIGZyaWVuZGx5IHBpbmcgb24gdGhpcyBvbmUgLSBpdCBhbHJlYWR5IGhhcyBT
cmluaSdzIFJldmlld2VkLWJ5IGFuZCBjYXJyaWVzCkZpeGVzOiB0YWdzIHBsdXMgQ2M6IHN0YWJs
ZS4KCk9uZSByZWJhc2Ugbm90ZTogdGhlIHBhdGNoIHdhcyB3cml0dGVuIGFnYWluc3QgdjcuNC1y
YzIsIGFuZCB5b3VyIGZpeGVzCmJyYW5jaCBoYXMgc2luY2UgZ2FpbmVkICJzb3VuZHdpcmU6IHFj
b206IGRpc2FibGUgdGhlIGludGVycnVwdCBiZWZvcmUKZ2F0aW5nIHRoZSBjbG9jayIsIHdoaWNo
IHNoaWZ0cyB0aGUgcnVudGltZS1yZXN1bWUgaHVuay4gSSB2ZXJpZmllZCBpdAphcHBsaWVzIGNs
ZWFubHkgb24gdG9wIG9mIHlvdXIgZml4ZXMgYnJhbmNoIChhcHBseSArIGJ1aWxkICsgY2hlY2tw
YXRjaApjbGVhbiksIHdpdGggdGhlIGVycm9yIHBhdGggc3RpbGwgcmV0dXJuaW5nIGJlZm9yZSBl
bmFibGVfaXJxKCk6CgoJLQljbGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CgkrCXJldCA9
IGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKCSsJaWYgKHJldCkKCSsJCXJldHVybiBy
ZXQ7CgkrCgkgCWVuYWJsZV9pcnEoY3RybC0+aXJxKTsKCklmIHlvdSB3b3VsZCBsaWtlIGl0IGZv
ciB0aGUgY3VycmVudCAtcmMgY3ljbGUsIEkgY2FuIHJlc2VuZCBpdCByZWJhc2VkIG9uCnNvdW5k
d2lyZS9maXhlczsgb3RoZXJ3aXNlIGl0IGNhbiB3YWl0IGZvciB0aGUgbmV4dCBtZXJnZSB3aW5k
b3cuIEVpdGhlcgp3YXksIGxldCBtZSBrbm93IGlmIHlvdSB3YW50IGFueXRoaW5nIGNoYW5nZWQu
CgpCZXN0IHJlZ2FyZHMsCkRhbmllbCBDYXJ0ZXIK

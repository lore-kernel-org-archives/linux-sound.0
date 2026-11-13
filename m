Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603782;
	b=lAcB7Aaiq+FJCIuZTHMc0MvEjuJnkscRWRetrI5ShChjmreUVPjSAACeySwOCRJFPY/m
	 hb/doGt76VI2UmzE4CLF7inGLnP6rdapnom2dii8BZyK//JRAWJMap9p9rDis9GDYfsjM
	 ixCb9t5RUTyLYf8N5E1yBz60Pqj1Hk0m4JwP4Bwuc6dJbD9zD6hBEufsEK4S+TpX7YOdA
	 P4+nqReSz58WSiIg1dgTT6/ktpAn7Ro7c2GrMoZHV+Q0DWlBQ3S7nGkU3CST5iCMpORCF
	 3X4o7+FtezGZSt4UjDEikm/6JdJ73N4p/P14Jjc5aEEae4lgM4hFe+CDbHauruBoilA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
	b=IHtTBOsbrYZzw2afFrWiH9ih4kOP9UFDQEm0bIQyIEq9tmYjKiQ2U5054UUGeZYx3VjS
	 9fr15TgVdgdTGFkxp8MHMcRwwksR0UYUSncRI9ddWWTqjObdG9CeVWigPATv63Ni3s1MO
	 LPmQyHlCx77WJ1e5bM0+kpBCQGU2ml5wk90oVP9+F/zTM5jD9x7/HIch9MEzg8WwKuRwj
	 DhccLp5pYSPvnvtfyzhDNdaN/oPUHdVIwwaxwB7guRfgIgOM4f8DfF16AaOroTge6Q2su
	 ncLS8/vg6065IrUfkxWqAwROoydnFjYJAop964bqPpaORpM6mVDtjvoAcSkZI4A5qkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C411606A33D
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C411606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHLACVWh
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214af2076so9124165e9.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603780; x=1795208580; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=CHLACVWhovnsNiZdUJHI0G3UixV34Vj/LecHfz/DFEkccalsYUW3udTSzkysCOGL1b
         aDqILnh4yZF59Gy3/31VIkG/DkCRlPI6iuNa3m9Me9GUazkGC3JEKcBAsqH5XWnZt+QO
         oFn/p0TQpQxOcESlUjguSqrsQP99L0DpeWO2UgyV9wb3LuQF+UrrTIgYAoVwcHmdZMjW
         h2oOo1blRZdaUOf0Bf3p5EVNpebP3WSOOrD0jZCUQk5DCGsvzItGoOJS8k9yGgbyUAq3
         PIQX4Q/zT8wZtnkDKIaJvCRm0fifsBFShIovQqDY2okGec1NyQ5uZ1F+HMyORVto6fOE
         GzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603780; x=1795208580;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YIWlt0CTYiM+svV/74oGw7W78322uqj/tiwi3ISAHsc=;
        b=hYFbCmSewxfT08405Q5oKU09PNbk8gpSiwlU2t2PQ1eTfl/Qf5zxl3XNKnFK+QlIGh
         d8pk0ifFCnoMr6pv8eSHTdK2x2p1Qg1f5QKuyUKnJAvufHQH8zyXyv+wQEq/GEI+r0QN
         c2bnI9mI8/s3hMWgv6mlqj0A5UAPvVSXAQDSqU0CzHaP3SC+CLoqeaLo4b7FV3FqUWeW
         cbShKY5SjxYn0ZlZhEJ97tOzlrWTdRc+wFjngaN4ZY67Frdcpo2ADKsV7JdzEJfdLLL7
         yG4a+1i13ujlHWf8D+Db2pLClL4eehqysmkfLeGeQtdtmKsRF5uE+OeHqgE0TU8GalOY
         DvCA==
X-Forwarded-Encrypted: i=1; AL+hErHTgqu1M9lgVRbjwptLIQ9NIk22l9bfa5nz6xsgbmwJvVfArVGc2JlFV4hdbFADMET83Ipeq8S7AFh2QA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9lefTizIGZYsx5Y6+LZ72D8nXOLfc9VPzTkQ/WVpB2iX8aMBXB
	Gzijq2VmCURVLrlkyeP0gBMXe7g/Du2yDYLZlsWVbK6U6VVqv7GuPd5d
X-Gm-Gg: AYBFou3rw0tT10+wS9UOeUMZZbCBuD5kQWtK52OcisbX0kuqtjf/qcbQLJMdgWjou3h
	/pqAOY4vDYnrjk3IbKwvmxMWB4Eck2FOpcP27+1PRinTWK9nd7ILteK/bc227gv/O1nSs44MQN/
	mgGmH0afRD/YliS870pbXCTWg42Txc/u5bSmv2cpAf8v/GyDnZoVlXvrJS1t5edZ0h3va8pEwKc
	IwwpchX+3RusbjEQkPJCr/kjF+BxcMlzIY4PaseK15r614GbA1KaU0SUBTPNciKzIv6doyl1ton
	MCydWvexigfhNu+uIDic3gmbi3ZJsuG8s2RswGXHnGMarbnyl4kq0ii13ycHaSBIYRghGR5jq0x
	MQ8WTo1GSNV5vDPGU1y7EKkXVhDnT9KHrHGQzg1hd9kanrcewA2bcW+JS9TAxHOvmAAkoCHxed/
	DjGt4GEa2zElKDOliOhSt+3z82d7WQ7nAWDfBVsTZgu2DK6h/CumjQ4NXFI+pxObwmuBmfojMQt
	10AoAG/IeYU14DmhWTeCPlt7Kmmw3mdJFz1/KrusfFgd55hOiEG
X-Received: by 2002:a05:600c:628c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb55a7f885mr75593975e9.31.1794603780470;
        Fri, 13 Nov 2026 13:03:00 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:58 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:58 -0800 (PST)
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
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v3 4/4] soundwire: qcom: check clk_prepare_enable() return
 values
Message-ID: <cc928d726ea34f5cb37fa140ca791e58@gmail.com>
In-Reply-To: <4aaa766cace2455ab6c75ab801df357f@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Y2xrX3ByZXBhcmVfZW5hYmxlKCkgY2FuIGZhaWw7IHVuY2hlY2tlZCwgdGhlIGRyaXZlciBwcm9j
ZWVkcyB0bwp0b3VjaCByZWdpc3RlcnMgd2l0aCB0aGUgaW50ZXJmYWNlIGNsb2NrIG9mZiwgd2hp
Y2ggYWJvcnRzIG9uIGFybTY0LgpDaGVjayB0aGUgcmV0dXJuIHZhbHVlIGluIHRoZSBpbnRlcnJ1
cHQgaGFuZGxlciwgaW4gcHJvYmUgYW5kIGluIHRoZQpydW50aW1lIHJlc3VtZSBwYXRoLCByZS1l
bmFibGluZyB0aGUgd2FrZSBJUlEgb24gdGhlIHJlc3VtZSBlcnJvcgpwYXRoLgoKU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIENhcnRlciA8eWFzczI3MTA2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgfCAxOSArKysrKysrKysrKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Nv
dW5kd2lyZS9xY29tLmMgYi9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKaW5kZXggNDczNDQ5ZGJk
ZmEuLmM0NGJjZDBmMGNmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NvdW5kd2lyZS9xY29tLmMKKysr
IGIvZHJpdmVycy9zb3VuZHdpcmUvcWNvbS5jCkBAIC03OTksNyArNzk5LDkgQEAgc3RhdGljIGly
cXJldHVybl90IHFjb21fc3dybV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCiAJ
dTMyIGk7CiAJaW50IGRldm51bTsKIAlpbnQgcmV0ID0gSVJRX0hBTkRMRUQ7Ci0JY2xrX3ByZXBh
cmVfZW5hYmxlKGN0cmwtPmhjbGspOworCisJaWYgKGNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5o
Y2xrKSkKKwkJcmV0dXJuIElSUV9IQU5ETEVEOwogCiAJY3RybC0+cmVnX3JlYWQoY3RybCwgY3Ry
bC0+cmVnX2xheW91dFtTV1JNX1JFR19JTlRFUlJVUFRfU1RBVFVTXSwKIAkJICAgICAgICZpbnRy
X3N0cyk7CkBAIC0xNjk2LDcgKzE2OTgsMTEgQEAgc3RhdGljIGludCBxY29tX3N3cm1fcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBlcnJfaW5pdDsKIAl9CiAKLQlj
bGtfcHJlcGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxl
KGN0cmwtPmhjbGspOworCWlmIChyZXQpIHsKKwkJZGV2X2VycihkZXYsICJ1bmFibGUgdG8gZW5h
YmxlIGlmYWNlIGNsb2NrXG4iKTsKKwkJZ290byBlcnJfaW5pdDsKKwl9CiAKIAljdHJsLT5kZXYg
PSBkZXY7CiAJZGV2X3NldF9kcnZkYXRhKCZwZGV2LT5kZXYsIGN0cmwpOwpAQCAtMTgyMSw3ICsx
ODI3LDE0IEBAIHN0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgc3dybV9ydW50aW1lX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQlkaXNhYmxlX2lycV9ub3N5bmMoY3RybC0+d2FrZV9pcnEp
OwogCX0KIAotCWNsa19wcmVwYXJlX2VuYWJsZShjdHJsLT5oY2xrKTsKKwlyZXQgPSBjbGtfcHJl
cGFyZV9lbmFibGUoY3RybC0+aGNsayk7CisJaWYgKHJldCkgeworCQlpZiAoY3RybC0+d2FrZV9p
cnEgPiAwKSB7CisJCQlpZiAoaXJxZF9pcnFfZGlzYWJsZWQoaXJxX2dldF9pcnFfZGF0YShjdHJs
LT53YWtlX2lycSkpKQorCQkJCWVuYWJsZV9pcnEoY3RybC0+d2FrZV9pcnEpOworCQl9CisJCXJl
dHVybiByZXQ7CisJfQogCiAJaWYgKGN0cmwtPmNsb2NrX3N0b3Bfbm90X3N1cHBvcnRlZCkgewog
CQlyZWluaXRfY29tcGxldGlvbigmY3RybC0+ZW51bWVyYXRpb24pOwotLSAKMi41NS4wCg==

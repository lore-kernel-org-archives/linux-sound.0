Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9FD1862
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772570854; cv=pass; b=Q/9peVzlPR48hr8lst7o1xMg8whfUz7KtiahOgjV7lPLNUCc7WSiUgoRm+Za07wKTOV/h5ZLGoqDkQAKsjuMmTQ4BAGEPtCJB7SNuF+g9ZPkFDsZgGfI28Orz/KAmVRwxH0Kw2gI/GE0r5v0fg5W+mybj7jbk0DoD4eUU2GDDfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772570854; c=relaxed/simple;
	bh=xfyvHQMIN8v09SJTHWaJlZvBGmLWdidMZR4N0iqvGKg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=PR+nFOzGfBCOyi24DXL7MJ40aYxowAxTeb/X56yNuIY3GpcF2zarD8C6DRVxByUUYi9Ay9IVl23ChxFD4lzkTIgSWZejVqEgszAdObF1YX9wuggsz4T9ZCnwMlTd3J1dFcYOBRTPr9LPgAOxe6YkigKFLJwUrma6TwxAN1GmB2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fz+RJk13; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz+RJk13"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439c4bde55cso440006f8f.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 12:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772570851; cv=none;
        d=google.com; s=arc-20240605;
        b=cSPPnmkd5p6GUulGqPtlh6rmsN4Ffgb3uHWamI16n1cyXoPxZb3YJN4xEE1QkaULds
         YE5WsecunhbTzxq4KP196cEEXnFp1+YASf30IpGuXUOpF0Erpj2/ZI5+sNgWCf/7HBJm
         ml9Cdcg2+O6vPmxs8/6+T5l6rwiV9FiSSE33W/SUaurn1jdVPjqYFePlfJKn5hKldpf4
         HXr7qUKSj6sdI7vjWZcyz64UcO8gXeCtR21pcuyTS8rRpFFiISVifRLAVMKm3bXBTomW
         oWRjJbZJlsxzFmNfN5xkhZF9mFVItxRN0Ldb9Txv79IpoAoqv9IBttt48Ei1erSwag/s
         C3XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xfyvHQMIN8v09SJTHWaJlZvBGmLWdidMZR4N0iqvGKg=;
        fh=kpr3ikDI9t/iP00V5GxYhsBExhJhFddqJGY75LSRDmw=;
        b=WnGrgxu/MLTWD2aJ44FQ4DICjlee8WO0KRwkDqkXMl1inzteFD5bC1J8i3NJjXt6Sd
         fGaz4ekQ+HzjawPmTA1W1zomY4iZJ4zXGFfHVg1v/fdrZ/cxtpOym1jhf0M80FMFimP3
         iHXLXQ+4e5VFYXG25JWsD4QscwmXsUoqaR78P2zJVZuZV88E7EZgeiU5MW3dZgQowEWD
         WRM+2dZk4fS3KSJnaW6ebN6wP1ePBQP8S8P60sNTu3gkw36T/ZIt2gGS2mqHHfZTErog
         iCDPDlaDhLThLme0A0Dnl57jnAXxnswar1RF3Evg7A7AoV7RtXfH5MnwlG82smcVHj2B
         WhAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772570851; x=1773175651; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xfyvHQMIN8v09SJTHWaJlZvBGmLWdidMZR4N0iqvGKg=;
        b=fz+RJk13nV+uN64PBwpU01UX+SWIFfiRsfYxUVf2nnLyE3xdo02h0OBYkDqNRZ3H5d
         0RBN4LZyT83LZi859f0+w8CpWDMcEvwVxf5MS4m6xjKMM48mU7rnn67krrTDrqDqM5j+
         Fk6QusliLKqeUxWF0TN0xbuDqaToY1PwDI7phVlxEgoOQPChk3UZ7qJEEM9/XnsU95Zw
         MpLGjoakL8dbuut8mFsTQIWAxvTE1XTjCVLgpB0c3MDbeDqd/S1Cg6qzWQsfZRYZGvuT
         R071i2VYXfF0lKBmFI8y8IaMHHrDiEHQc6eJhPdN+xWFNsvVMKxhsoztEeoBYdTxyn8s
         rnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772570851; x=1773175651;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfyvHQMIN8v09SJTHWaJlZvBGmLWdidMZR4N0iqvGKg=;
        b=hInfQ0kXhdzhOcnQSag8BZAKRU78hw/7yK+W1rbU4pMwANKeoED/jnliB58HuThYtG
         fK/rZ2uAJUpMGA/LCXZgdGXBZlPKv8bPx7B6cK2tqhgaaCD0ezDhZdgVbmdnQpK6v1D/
         ImtWjGhHOOlbmJVheLkzwrHBrVflSEgLds3znWqT980W8pp/9U10z/LwUStTb5badXt+
         gqPsuI7vEU7/rVOTTn8hI/4PLUA4p3kd+0S6dkm/EqiLBP0GavyVFC2rl23JBd2W5ynq
         OoKm5oK5JS8sOmGFzzqTfcSc27U5H5JQw01oVTGeLuB+sfdsJHd4AMQpFhRdULXtyQjP
         dbUA==
X-Gm-Message-State: AOJu0YyOa+daBSANKKmptxGpPRevruXbuoTuc9901ZBFX7NjAg8or+fb
	2lXgsZMq0eLl127nDMEcCQ5Yxtf4C/aGX/JWuFCntZjX+WJgvEwOvjIeamjbrBBHGFzTDowQAVS
	1CNcFUlvhrRHmNNGlNPzHSmvPbz11NYxDtnst
X-Gm-Gg: ATEYQzzm1jgYhPJAwCnWElqJwLnxu8+Rr5GI0LfsRaBTHA2fY43T7GCVCu3eosZPE63
	0ptIEZmfwpMLRjlqu3abUDVU6X/BbkuIxjV47tOOr354F/3S5gm0gSm3VYaos5M5xIjO4nu8pnJ
	G1kVNloA3nIuGGln0StgCHD0PQgnNw+HIVSBuOGIAHpohemHEpMQTBkcAdEr/sbZNf3JXFfU4Os
	AZ6CUvWNBAoF/1kZuHkNCtqN7ApjQAkcuSiAP9FZQPnoO4ActNUAxumpFjbZniUeMgR3I3IgiDz
	5zx4
X-Received: by 2002:a05:6000:2384:b0:439:b4dc:1e1d with SMTP id
 ffacd0b85a97d-439b4dc2030mr17864883f8f.44.1772570851499; Tue, 03 Mar 2026
 12:47:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Philip Willoughby <willerz@gmail.com>
Date: Tue, 3 Mar 2026 20:47:20 +0000
X-Gm-Features: AaiRm5142uvixVESvyaqv-ORO61FWXyo7llQzIbRSVKbmPokA75nfRG1_jbEVts
Message-ID: <CAKSkzpsn71v1GQYkj9pGq_FjyLaY1HT_7qBmJqUj75OEXEGbNQ@mail.gmail.com>
Subject: [PATCH] disavow Arturia AudioFuse 16Rig
To: linux-sound@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000f182e0064c24cf7a"

--000000000000f182e0064c24cf7a
Content-Type: text/plain; charset="UTF-8"

Short version: it doesn't work (no audio IO works) and it actually
causes harm right now.

I made this patch to make it easier to test my in-progress custom
driver, I'm sending it out because the current behavior stops the
device from working as a standalone device as soon as it's loaded.

During its probing, snd_usb_audio changes the sample rate to 192kHz,
which has the side-effect of disabling all the ADAT inputs, ADAT
outputs, and mixer inserts. With this patch (obviously) that doesn't
happen and the device carries on doing whatever I had configured it to
do.

If I get a dedicated driver to work I will of course report back to
you. Thanks for the assistance thus far.

Phil

--000000000000f182e0064c24cf7a
Content-Type: application/x-patch; name="patch-willerz.patch"
Content-Disposition: attachment; filename="patch-willerz.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mmb21gxo0>
X-Attachment-Id: f_mmb21gxo0

ZGlmZiAtcnVwTiBsaW51eC02LjE4LjE0L3NvdW5kL3VzYi9xdWlya3MtdGFibGUuaCBsaW51eC02
LjE4LjE0LXdpbGxlcnovc291bmQvdXNiL3F1aXJrcy10YWJsZS5oCi0tLSBsaW51eC02LjE4LjE0
L3NvdW5kL3VzYi9xdWlya3MtdGFibGUuaAkyMDI2LTAyLTI2IDIyOjU5OjQ3LjAwMDAwMDAwMCAr
MDAwMAorKysgbGludXgtNi4xOC4xNC13aWxsZXJ6L3NvdW5kL3VzYi9xdWlya3MtdGFibGUuaAky
MDI2LTAzLTAzIDE4OjE3OjQ4LjgzNDQyMjcxNiArMDAwMApAQCAtMzkwMCw1ICszOTAwLDE0IEBA
IFlBTUFIQV9ERVZJQ0UoMHg3MDEwLCAiVUI5OSIpLAogUVVJUktfUk1FX0RJR0lGQUNFKDB4M2Y4
YyksCiBRVUlSS19STUVfRElHSUZBQ0UoMHgzZmEwKSwKIAorLyogQXJ0dXJpYSBBdWRpb0Z1c2Ug
MTZSaWcgZG9lc24ndCB3b3JrOyBkaXNhdm93IGl0IHNvIGEgZHJpdmVyIGNhbiBiZSBkZXZlbG9w
ZWQgKi8KK3sKKwkuaWRWZW5kb3IgPSAweDFjNzUsCisJLmlkUHJvZHVjdCA9IDB4YWYyMCwKKwlR
VUlSS19EUklWRVJfSU5GTyB7CisJCS5pZm51bSA9IFFVSVJLX05PREVWX0lOVEVSRkFDRQorCX0s
Cit9LAorCiAjdW5kZWYgVVNCX0RFVklDRV9WRU5ET1JfU1BFQwogI3VuZGVmIFVTQl9BVURJT19E
RVZJQ0UK
--000000000000f182e0064c24cf7a--

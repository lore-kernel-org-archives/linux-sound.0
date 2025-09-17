Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7742F32D5DD
	for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099863; cv=none; b=nbb9WrLM1aP9U6srNRYUh0CbLZFgK7mTqGhtM8eBpmKft55FsOu7tWYLUKQ71U4hULdfqEarFzjHdz18YCWBZBgp9N92wzVvKBlZzShgfvxccwRQ5+mG0k7ehWAalrqoObqbRKrr7BatGKetpbM5Y3HPJR5KnR45+RVL+26JQT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099863; c=relaxed/simple;
	bh=ZknuNHFq0tyeptFvJcnnsXRV6fSiqoXd5zwMcfSSKD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBtswo5+IVcgpooV3tvw8RQnzinAxDFaF7s21ScW0WflH3DyfmMte9P9kxnHkCyt/2yTw1W6AZl/G12ZZpYS19wNImsiwcjGY0lPIUAOlUVZZAzMlSU3Uc0lG1subwpVCZzts8sH9MwjjaK7HMjQ6Occ+zPL3gRT3by1rMkpfOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=innEyywP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="innEyywP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758099858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=x5npCVbmbW8kT6qQZFnkl4JniL63oW0fDP/nvQRcCcY=;
	b=innEyywPK0RhpC8qj/pKjiMx2bMO0emxYhTHGrG8/+Ks0CyMey7VatlbLw23OKlbzNmuAk
	oQYPDEhW313CNxnjEbPeuI2Mr1aFoQV2cm2tt1E4f3uT9hY33OWvqjKz+++kcVqoTItteO
	c0JLXmQgjWOc2HShuu+NWQjeHUvovls=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-xKd_1M1vOWuY7LeH9K78Jg-1; Wed, 17 Sep 2025 05:04:16 -0400
X-MC-Unique: xKd_1M1vOWuY7LeH9K78Jg-1
X-Mimecast-MFC-AGG-ID: xKd_1M1vOWuY7LeH9K78Jg_1758099855
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3ece14b9231so120822f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Sep 2025 02:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758099855; x=1758704655;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x5npCVbmbW8kT6qQZFnkl4JniL63oW0fDP/nvQRcCcY=;
        b=qigEqrXAwrrz/bdo1LmQoSp5I28dHDeG1MceuTBpKeZRa1DIQA0r/EGYf6KGCZp+6F
         XkSE7TnY838zFK6uDxPaW3b/BhE0OOf/kXQ7kH4DmszGQctJqZ3u5zjb4h6JfZgIiAxg
         S6kStYQfdAzHzlJ+qZW2xr7cWetrDMun0DgtGBfoDI6LT1hwplyoJ8WNa+9cFW+7inZB
         2BkB+a8CiVgD0JbMfBE9Mt5l7E6l6fD0276G3m110YLDP7UPwXKhCjgAd5Sav17ICljl
         eSJtbBs+R8mcxXEK4jMlv0Z0NaVFjG5RFi5GnT4HSJJAbPCBuLuWagYj2IgAnRU9nHWp
         NEFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKm1MRtLLkZNEXy5XzuKXSQtbRf1wN/2QJOz14Wx/DasidrJXi7sWkT2UGn0eXHNBHSQcUf9fNuG4+BA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0w8rY5IJI87/JNQnnDs6unhg4TGkJfRUI64/q8MJ9K1Y+SJTS
	Mn+TZ157h4aM5EC92QivBUVjpJRCa4s0teyM86JH/SNzx/pseal5RvdCnhtUu5Hey/ydd7jYX+x
	L6SX4HVmAe/NTeYuuheAP2X9K7GZ6ejWZd+HhmN5WzwntRZaJvYBJoYbIkJwkVh5j
X-Gm-Gg: ASbGncvixoKcqkFSQ/ADOyD8LKJNMgGjBiabYVnx30SFnfamiwFhIcLqc9s2c+bQ2OX
	odPeTZdmvsVQ2SPYIkKalStukho8Gsfk4aRdcK/3bGGURKp0/wCJWQbptZEVaWsew5p8kPBg016
	eCnfAnvDLSmndle4bCa8EoUqQG+TNDpnoipyB+uGPnM10kt5Dwt4l9Sc4gv27Ei1Pz8Uc0pXFFh
	loaizqJki5pVwAHNcTqz78L8JCk98PyMA5xgSw5gX6hWuG/VN5fJ3bq80ZBG1cizxLNzmCmTL0p
	KGN8TO1hediCCaKeBdF1JvzTeIaQbYuLK6Ws9LUDKZ54ucdn4iVif2VGphe755kaEqfDoZqOXY+
	KryDk3k/qcqEqJDYB4lbPe80KENy4rgQLS/S7E4Q3pJjx6Js2Bt23JHX2R3lNHJa0
X-Received: by 2002:a5d:588b:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-3ecdf9bec6cmr1252293f8f.10.1758099854802;
        Wed, 17 Sep 2025 02:04:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdI4OELMUMHMlRwzj6+l/2Y9hePxscl3Z5Y6ewrNZjZAKUiJVhUKBuG0aAn+4uFmb0FpMAtQ==
X-Received: by 2002:a5d:588b:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-3ecdf9bec6cmr1252248f8f.10.1758099854160;
        Wed, 17 Sep 2025 02:04:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:6d00:7b96:afc9:83d0:5bd? (p200300d82f276d007b96afc983d005bd.dip0.t-ipconnect.de. [2003:d8:2f27:6d00:7b96:afc9:83d0:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613a072a38sm30431035e9.24.2025.09.17.02.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 02:04:13 -0700 (PDT)
Message-ID: <4551b48c-eba5-42a3-aa53-74d412a126b9@redhat.com>
Date: Wed, 17 Sep 2025 11:04:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [sound?] kernel BUG in filemap_fault (2)
To: Jan Kara <jack@suse.cz>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 syzbot <syzbot+263f159eb37a1c4c67a4@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, chaitanyas.prakash@arm.com, davem@davemloft.net,
 edumazet@google.com, hdanton@sina.com, horms@kernel.org, kuba@kernel.org,
 kuniyu@google.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com,
 willemb@google.com
References: <68c69e17.050a0220.3c6139.04e1.GAE@google.com>
 <80840307-942d-4e7b-849d-2ca9bb4bbefa@arm.com>
 <lqzgi7abe2onda3faavn5ays6gdw4syiu32hmrfaibrh6cmozs@pjf3llvnnefk>
 <7e338491-0c6b-4b65-93b7-df0af8b2fd87@redhat.com>
 <s5pl5yhhxyz7dn4r2v6c4ll53ejboe5xa5226ytgg7kjirgmh5@tofyas4lp4uy>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <s5pl5yhhxyz7dn4r2v6c4ll53ejboe5xa5226ytgg7kjirgmh5@tofyas4lp4uy>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kreyGciOJLgSDSDmUnzGYHBiHXbeCFni7-sCfk72-mI_1758099855
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> 	if (!lock_folio_maybe_drop_mmap(vmf, folio, &fpin))
>> 		goto out_retry;
>>
>> 	/* Did it get truncated? */
>> 	if (unlikely(folio->mapping != mapping)) {
>> 		folio_unlock(folio);
>> 		folio_put(folio);
>> 		goto retry_find;
>> 	}
>> 	VM_BUG_ON_FOLIO(!folio_contains(folio, index), folio);
>>
>>
>> I would assume that if !folio_contains(folio, index), either the folio got
>> split in the meantime (filemap_get_folio() returned with a raised reference,
>> though) or that file pagecache contained something wrong.
> 
> Right.
> 
>> In __filemap_get_folio() we perform the same checks after locking the folio
>> (with FGP_LOCK), and weird enough it didn't trigger yet there.
> 
> But we don't call __filemap_get_folio() with FGP_LOCK from filemap_fault().

Yes. I should have clarified that we haven't seen the VM_BUG_ON_FOLIO() 
trigger on other callpaths that set FGP_LOCK, because I would think the 
very same problem could happen there as well.

> The folio locking is handled by lock_folio_maybe_drop_mmap() as you
> mentioned. So this is the first time we do the assert after getting the
> folio AFAICT. So some race with folio split looks plausible. Checking the
> reproducer it does play with mmap(2) and madvise(MADV_REMOVE) over the
> mapped range so the page fault may be racing with
> truncate_inode_partial_folio()->try_folio_split(). But I don't see the race
> there now...

__filemap_get_folio() will grab a reference and verify that the xarray 
didn't change. So having a concurrent split succeed would be weird, 
because freezing the refcount should fail. Of course, some refcounting 
inconsistency could trigger something weird like that.

I can spot that we are also manually calling 
__filemap_get_folio(FGP_CREAT|FGP_FOR_MMAP) on the else path if 
filemap_get_folio() failed, maybe that's the problematic bit (and maybe 
that's where readahead logic makes a difference).

-- 
Cheers

David / dhildenb


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555999;
	b=uUZPJ/PXtJLG22eMmR9ECklr0yPAZUQ1mfzlstgFajijZ+d63oo3iyZWXPFzhgLnKy8w
	 Zma3FbMrtmyDyMT4SXhzMpoioWnBN01peUaAPsZ6Iv2JrXmPirgEhQoHZtRGXcN+oMiJ0
	 HRjQ4pA3u0Gk1/mco2KwuhDQ3dI8++ggLbCZm9E71REBvGSJ2rBtyW6zQBUNftHbVBT8j
	 f54gX0h+aXFSqYQ0lk4FmZGC2+B8fRX3ctkLzpnpGURe9F+4K0e6lTBhvPQuT2Jg+bNub
	 j5Nd1UmR+rhQu7E9eRE4oF6IORufoaL9viri+dh29KEjyUvOtQvc9XkSbIHZ9nxcLeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555999;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=cpoRNZqbvwqdCC77NrNKVF9JUgd4Dz4ZwVQhoepOwKU=;
	b=fbmFs77jMNRbOmTM84+F97IqUfX2b0BuSrYlIAGtFjJrGwwfberuxmvcdWMV5P0lvWnW
	 sSsHVwjXMLqgwtd59j0qh9ySIjDV3v4oazFFWFCTmcesGd3EC0w8GzO015sHm23gKAyMt
	 1IZKZM6CU7/7bellwT0RTV3gvfI1LyURvQYkG/kjct5WzFVfAUVbEhe3QUyu6XDALyX2q
	 NA8GaWzuNIa4vllpkxC0WOUisohGVELE08adBE0pfBhp5igQHUy+1UBRrKORFxF77qxKP
	 F8eaVNL918qKa8L9VOTmEFmzDcaWVjwW9t8nz51f+TcCE19DxPY/SAMTerHLGJ93zBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xx+ksFqh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1B606A31E;
	Tue, 24 Nov 2026 21:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xx+ksFqh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8C41F000CF;
	Tue, 24 Nov 2026 21:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795555999;
	bh=cpoRNZqbvwqdCC77NrNKVF9JUgd4Dz4ZwVQhoepOwKU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xx+ksFqh4IuTLUhgnYaUpOB8MUTvPbA08Q2+IGX4OyLTdtTRLDlpmn47R+jAZrbkb
	 EyeL83fmgrhB/UJRXW7bCDqXOS9qlbm7XpRrxYuYMOBYt7c4EYrE8/6T/fPGh/C1BC
	 rTfEc4c5uhpq5aSwIKfTZoRdbBkaWjfx1ZPQR41OZr0lKb/JLEAnAqfaN2yg52Ohiu
	 6LVU8fzeQ0UZyBfzFbS85NpZaruwUoW2GC/rtjXdsMhuANLrU81YLjxDiSqWeDhUnx
	 O+oZ5AZvHy0ZdRmd5BCDzz5ttKPH7T0Qr3LR5ze+kgjIhAGPP0UkJ02e9gi9lfkzw9
	 cgqePH7EXAqMg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023211125.2738290-1-lcy8047@gmail.com>
References: <20261023211125.2738290-1-lcy8047@gmail.com>
Subject: Re: [PATCH v2] slimbus: messaging: hold lock until transaction is
 completed
Message-Id: <179555599817.422527.2957210819903664657.b4-ty@kernel.org>
Date: Tue, 24 Nov 2026 21:33:18 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 23 Oct 2026 17:11:25 -0400, Changyul Lee wrote:
> slim_msg_response() releases ctrl->txn_lock right after idr_find()
> and then uses txn. If the request times out in the meantime, it
> returns, and txn is no longer valid.
> 
> Keep ctrl->txn_lock held until complete() returns, so the timeout
> path in slim_free_txn_tid() waits until slim_msg_response() is done
> with txn. Call idr_remove() directly, since slim_free_txn_tid() takes
> the same lock.
> 
> [...]

Applied, thanks!

[1/1] slimbus: messaging: hold lock until transaction is completed
      commit: be8c99872eea7efb4b32b3fee01af91b76a8da39

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


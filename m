Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F14E30504A;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168850; cv=none; b=JIF0MCnbUdtPpKHeerO7Y5K92RsbCTuE4kPNs+NYpHWErciy/tBNTimkGl0v/vikSEOBkEBRaKIkzRpf6dvMlcS+dHxTnDRw/hSZwI0yJIP32XYM39FluLZ7ig0G8+Pj2MfMXgHPlA8ibkpAWWkArjY7LpMf4MzeGuUjr9Lmel8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168850; c=relaxed/simple;
	bh=uQde3bxT2+cjr6kiK/aHusixvbQmut7ta5mQ8tq5wPU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YGtIsxKLABLJiTM4izUhUl0zRBS+X5DWN3XJBz2DW1bm/d5xrbEFSOc1TQJu9cA/4BQTT9PZl+CXR2SLGXU4UP2mm+pMk+qeT5y7Ry3z0jMCGF5CgI96M1iLJ2/Ji2i46f4p6H8ZYPN4bZ6wphsXbMZPfwwAjfP8KAInOB+MhAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r41ehEdp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r41ehEdp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96EFC4CEF8;
	Wed, 26 Nov 2025 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168849;
	bh=uQde3bxT2+cjr6kiK/aHusixvbQmut7ta5mQ8tq5wPU=;
	h=From:To:Cc:Subject:Date:From;
	b=r41ehEdpbFN8sipwz6R5MhsIXCPN+OfWeS854ab6sc0qRSunf/CUVuNM2UKA3ILMP
	 cxyyH5r0KaXJZJaButzQXo6JFSbB+rJkvqHh5Mzk0/82wPU2IoMVzjPU+CFFHEacm2
	 IXUIjsdiEs/anO8EeM34Vhn8g3njJyqmJVzBhu7KKxmG2Tad+OK7nhBJgvR+/1Lp4r
	 H1lodBZTrF2K60OuAdUbL4Ql5lFvkF+Uah79hKOy/M6rLA+ToUVF2Wh4vfS18lkb6l
	 S7hYiwkcjg0pKA+Fgo5zz+wbS1TsiTJ9iKXL4Snve+QIVbVkg+FCPfzXJzZ4Fxd5Rc
	 tEbHkTX6ZlEmQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOGuJ-000000001Jv-1CaG;
	Wed, 26 Nov 2025 15:54:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/6] slimbus: core: fix device, OF node and rpm leaks
Date: Wed, 26 Nov 2025 15:53:23 +0100
Message-ID: <20251126145329.5022-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes device, OF node and runtime PM reference leaks in the
slimbus implementation.

Included are also two related kernel doc updates and cleanup of one of
the involved helpers.

Johan


Johan Hovold (6):
  slimbus: core: fix OF node leak on registration failure
  slimbus: core: fix runtime PM imbalance on report present
  slimbus: core: fix device reference leak on report present
  slimbus: core: amend slim_get_device() kernel doc
  slimbus: core: fix of_slim_get_device() kernel doc
  slimbus: core: clean up of_slim_get_device()

 drivers/slimbus/core.c | 54 +++++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

-- 
2.51.2


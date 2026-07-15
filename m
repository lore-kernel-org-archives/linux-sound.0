Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA3F1A3029
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084847; cv=none; b=IGSpgnqipoQfOl+OV6CuVEhT/5ETn32jveW8UmktuzE7Ze8STkYAW8mVLhFAG0Pw8uu1YsC2kFMzLqSEIKymLvA8KW1NRQZqLb+BCrJOYPBCK487hezJGdcay2H3PfE7Efp8140jI13PhWPMa+cAebZ2Du0IxJVWTx/LJm95wQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084847; c=relaxed/simple;
	bh=+g8FekZWUYzDNxY0Ip40MyShN81+MPSVsJ1m+uVGynY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OuCYENJ+aKhJSQ9mfHpQwu4tqO6aaEsNeSUKvXE9UbASsm8stEDts0jmnYcYRs2sRepTHFTmLoHkbZ6ro05OXuD2awnwlxRXjQfOGytdq3CjDWkKhAr8V2iB3D6bzczvI5S3//iXf/PZtrPdfcneib3zcYiMeRNQn6U2NLEPBoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UTy08Wdz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UTy08Wdz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=sbD59O8C7IEtQZg0hghsSiXEtBsu9r3UGAbzUn9ABzk=; b=UTy08WdzKV1t0rREc5FBd2ThRE
	gzxUaCQ6ozDy6TJUgi1dFi0Nh5rJpF3PMfk/5jE002PpCry/T9j/cSjOLLrcBhnBF3CBBYWhiShoL
	L6vYcSXOUIiXFztiojyywS/rZb8l/dG3YUL8MyP+rXk8X3Aq7WZhz2Si8zaqXWgSkzkWwkbwv4BiT
	EuMmguH0+ye/8b76cgFmNeui3YFYgViKJNvdSFYY4wvPrboEuasDl3I9QHIuX/lfLRNh40j4cgeTj
	GGWVCeJHC2934xu9bzywwPnOeO53LHYzs7ZTGCheeiWlnf5j+5ci36mcwIaD03Tk4nWMqLX2F0ady
	bOVIFgLg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjpxw-0000000Df08-1rvn;
	Wed, 15 Jul 2026 03:07:20 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [PATCH] soundwire: bus.h: repair kernel-doc comments
Date: Tue, 14 Jul 2026 20:07:19 -0700
Message-ID: <20260715030719.757781-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct struct names (i.e., correct typos).
Use the struct keyword for structs as required.

Prevents 5 warnings:

Warning: drivers/soundwire/bus.h:86 expecting prototype for struct
  sdw_btp_section. Prototype was for struct sdw_bpt_section instead
Warning: drivers/soundwire/bus.h:100 expecting prototype for struct
  sdw_btp_msg. Prototype was for struct sdw_bpt_msg instead
Warning: drivers/soundwire/bus.h:125 cannot understand function prototype:
  'struct sdw_port_runtime'
Warning: drivers/soundwire/bus.h:144 cannot understand function prototype:
  'struct sdw_slave_runtime'
Warning: drivers/soundwire/bus.h:165 cannot understand function prototype:
  'struct sdw_master_runtime'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

 drivers/soundwire/bus.h |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--- linext-2026-0713.orig/drivers/soundwire/bus.h
+++ linext-2026-0713/drivers/soundwire/bus.h
@@ -73,7 +73,7 @@ struct sdw_msg {
 };
 
 /**
- * struct sdw_btp_section - Message section structure
+ * struct sdw_bpt_section - Message section structure
  * @addr: Start Register address accessed in the Slave
  * @len: number of bytes to transfer. More than 64Kb can be transferred
  * but a practical limit of SDW_BPT_MSG_MAX_BYTES is enforced.
@@ -87,7 +87,7 @@ struct sdw_bpt_section {
 };
 
 /**
- * struct sdw_btp_msg - Message structure
+ * struct sdw_bpt_msg - Message structure
  * @sec: Pointer to array of sections
  * @sections: Number of sections in the array
  * @dev_num: Slave device number
@@ -110,7 +110,7 @@ int sdw_find_row_index(int row);
 int sdw_find_col_index(int col);
 
 /**
- * sdw_port_runtime: Runtime port parameters for Master or Slave
+ * struct sdw_port_runtime - Runtime port parameters for Master or Slave
  *
  * @num: Port number. For audio streams, valid port number ranges from
  * [1,14]
@@ -133,7 +133,7 @@ struct sdw_port_runtime {
 };
 
 /**
- * sdw_slave_runtime: Runtime Stream parameters for Slave
+ * struct sdw_slave_runtime - Runtime Stream parameters for Slave
  *
  * @slave: Slave handle
  * @direction: Data direction for Slave
@@ -151,7 +151,7 @@ struct sdw_slave_runtime {
 };
 
 /**
- * sdw_master_runtime: Runtime stream parameters for Master
+ * struct sdw_master_runtime - Runtime stream parameters for Master
  *
  * @bus: Bus handle
  * @stream: Stream runtime handle

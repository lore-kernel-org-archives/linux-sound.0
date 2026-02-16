Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AA92E173D
	for <linux-sound@vger.kernel.org>; Mon, 16 Feb 2026 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771220663; cv=none; b=cIqRgSkeCI6UxIDt4v63yY2kJ5z4hfMLWq0kN6KBbeecgcwV9Z0fUXB568X3h9/ssu6kRuuEunk42lUmvZPz0dqlD+mv0chUxNG+f72y1G+VrHJ0H3seLbzt4NGtvUs5YatG3Y0DzLrPHqIcA/bFf6Kx6WNSkme0/8lAHuulTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771220663; c=relaxed/simple;
	bh=BoF+QZKdTlxW8y8JQfcOYeqcGVVO8dSR+bRHqPAYN/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KlxE4QCoslvkomdWWw/Bpox4uvTQsF9vx4xOO6NqvPc6ZG/huRP46y5J1E1OVY7yqLevgIOOzTYhxfH3p0p1n+HkBnE8ZXONnWD+KwNXHctU2844vxXZz01rpr22xhR6yb6DyIh0N1dYw/SPNg5CSYRdWv4CwMeDVprAGjTKMWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4UPmmpYv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4UPmmpYv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2Pov9Vej7JBCVJfVO7f7eZzrnIHl+6g4zT3sD1zPkOk=; b=4UPmmpYvFrJtJjY7YhceBzWTPF
	KQj4sJuERU89h/DoSxLZZQsYJOj5jx4fwo1Bs3FxljBWfdG/9ByYD9gcGPUOxiYynMGWp91ft3XLj
	lVayQqEQN9IA/G8YZ20+w5LnLPiIgQ/0zbvagHCKSmfbTNK0kEtwsWZ+or3u4jzMaWk9gXxnZo5wd
	tmVlHUAsCKn7z9iWhozXXRmG8LpKEKfV/Hhu/cfdiRLshEh/oWCDU8g52TRhtY8il8YlytJgi3gvy
	k0UdX7jJLoUdCn1jF+3dEajE5PiwEFz5/lUMWiyyPLhsNnC8U0ocoVpepOqJlSRjnZcAAttRGCtEk
	TyQpajnA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrrPA-00000005zfM-1v0j;
	Mon, 16 Feb 2026 05:44:20 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-sound@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: [PATCH] soundwire: sdw.h: repair names and format of kernel-doc comments
Date: Sun, 15 Feb 2026 21:44:18 -0800
Message-ID: <20260216054418.2766846-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix all kernel-doc warnings in sdw.h:

Warning: include/linux/soundwire/sdw.h:538 cannot understand function prototype: 'enum sdw_reg_bank'
Warning: include/linux/soundwire/sdw.h:779 struct member 'port_num' not described in 'sdw_transport_params'
Warning: include/linux/soundwire/sdw.h:792 struct member 'port_num' not described in 'sdw_enable_ch'
Warning: include/linux/soundwire/sdw.h:892 cannot understand function prototype: 'struct sdw_port_config'
Warning: include/linux/soundwire/sdw.h:906 cannot understand function prototype: 'struct sdw_stream_config'
Warning: include/linux/soundwire/sdw.h:925 cannot understand function prototype: 'enum sdw_stream_state'
Warning: include/linux/soundwire/sdw.h:942 cannot understand function prototype: 'struct sdw_stream_params'
Warning: include/linux/soundwire/sdw.h:960 cannot understand function prototype: 'struct sdw_stream_runtime'
Warning: include/linux/soundwire/sdw.h:1047 struct member 'bpt_stream_refcount' not described in 'sdw_bus'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org

 include/linux/soundwire/sdw.h |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

--- linux-next-20260205.orig/include/linux/soundwire/sdw.h
+++ linux-next-20260205/include/linux/soundwire/sdw.h
@@ -532,7 +532,7 @@ struct sdw_slave_intr_status {
 };
 
 /**
- * sdw_reg_bank - SoundWire register banks
+ * enum sdw_reg_bank - SoundWire register banks
  * @SDW_BANK0: Soundwire register bank 0
  * @SDW_BANK1: Soundwire register bank 1
  */
@@ -751,7 +751,7 @@ struct sdw_port_params {
  * struct sdw_transport_params: Data Port Transport Parameters
  *
  * @blk_grp_ctrl_valid: Port implements block group control
- * @num: Port number
+ * @port_num: Port number
  * @blk_grp_ctrl: Block group control value
  * @sample_interval: Sample interval
  * @offset1: Blockoffset of the payload data
@@ -782,7 +782,7 @@ struct sdw_transport_params {
 /**
  * struct sdw_enable_ch: Enable/disable Data Port channel
  *
- * @num: Port number
+ * @port_num: Port number
  * @ch_mask: Active channel mask
  * @enable: Enable (true) /disable (false) channel
  */
@@ -885,7 +885,7 @@ void sdw_bus_master_delete(struct sdw_bu
 void sdw_show_ping_status(struct sdw_bus *bus, bool sync_delay);
 
 /**
- * sdw_port_config: Master or Slave Port configuration
+ * struct sdw_port_config: Master or Slave Port configuration
  *
  * @num: Port number
  * @ch_mask: channels mask for port
@@ -896,7 +896,7 @@ struct sdw_port_config {
 };
 
 /**
- * sdw_stream_config: Master or Slave stream configuration
+ * struct sdw_stream_config: Master or Slave stream configuration
  *
  * @frame_rate: Audio frame rate of the stream, in Hz
  * @ch_count: Channel count of the stream
@@ -913,7 +913,7 @@ struct sdw_stream_config {
 };
 
 /**
- * sdw_stream_state: Stream states
+ * enum sdw_stream_state: Stream states
  *
  * @SDW_STREAM_ALLOCATED: New stream allocated.
  * @SDW_STREAM_CONFIGURED: Stream configured
@@ -934,7 +934,7 @@ enum sdw_stream_state {
 };
 
 /**
- * sdw_stream_params: Stream parameters
+ * struct sdw_stream_params: Stream parameters
  *
  * @rate: Sampling frequency, in Hz
  * @ch_count: Number of channels
@@ -947,7 +947,7 @@ struct sdw_stream_params {
 };
 
 /**
- * sdw_stream_runtime: Runtime stream parameters
+ * struct sdw_stream_runtime: Runtime stream parameters
  *
  * @name: SoundWire stream name
  * @params: Stream parameters
@@ -983,7 +983,7 @@ struct sdw_stream_runtime {
  * @defer_msg: Defer message
  * @params: Current bus parameters
  * @stream_refcount: number of streams currently using this bus
- * @btp_stream_refcount: number of BTP streams currently using this bus (should
+ * @bpt_stream_refcount: number of BTP streams currently using this bus (should
  * be zero or one, multiple streams per link is not supported).
  * @bpt_stream: pointer stored to handle BTP streams.
  * @ops: Master callback ops

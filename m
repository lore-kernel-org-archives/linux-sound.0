From: Jim Deas <jdeas@jadsystems.com>
Date: Fri, 21 Mar 2003 18:37:10 +0000
Subject: Illegal seek using file_operations write command from kernel
Message-Id: <marc-linux-sound-104827156202740@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I am having trouble linking my driver
to the sound subsystem. I can open the file
correctly but have trouble writing to it.
The open and close sections seem to work
including a test seek command in the open area.
The writeAudioFrame always returns an illegal
seek (-29).

Here is the code:
----------------------------------------------------------------
int OpenAudioDevice(char* AudioDev){

 int speed,format;

//-------------------Open Audio Device ----------------
// if((audio_fd = open(AudioDev, O_WRONLY, 0)) = -1){
//	 printk("ltc -> Error Opening audio Device.\n");
//	 return -1;
// }
	pbuffer = kmalloc(BUF_SIZE,GFP_KERNEL);//Create audio buffer
	fs = get_fs();
	set_fs(KERNEL_DS);//Setup for user space commands

	fd = filp_open(AudioDev, O_WRONLY, 0);
	if(IS_ERR(fd)){
		printk("Failed to open %s.\n",AudioDev);
		return -1;
	}
	if(fd->f_op->llseek(fd,0,SEEK_SET) < 0){
		printk("ltc -> Error seeking to zero.\n");
		filp_close(fd,NULL);
		return -1;
	}
//------------------ Set Number of Channels ---------
--snip
//------------------- Set Data format -----------------
--snip
//------------------Set Sample rate --------------------
--snip
//-----------------------------------------------------------------------
void closeAudioDevice(void){
	fs = get_fs();
	set_fs(KERNEL_DS);//Setup for user space commands
	filp_close(fd,NULL);//Close the file
	fd = NULL;
	set_fs(fs);//Return to kernel space before exit!
	kfree(pbuffer);//return audio buffer
}
//-------------------------------------------------------------------------
int writeAudioFrame(long tc){
int wret;
loff_t pos = 0;

	buildFrameBuffer(&tc,pbuffer);//Creates a waveform size of BUF_SIZE
	fs = get_fs();
	set_fs(KERNEL_DS);//Setup for user space commands
	if(fd){
		if((wret = fd->f_op->write(fd,pbuffer, BUF_SIZE,fd->f_pos)) !BUF_SIZE){
			printk("ltc -> Error writing data to audio device sent %i got
%i.\n",BUF_SIZE,wret);
			return -1;
		}
	}
	set_fs(fs);//Return to kernel space before exit!
	return 1;
}


